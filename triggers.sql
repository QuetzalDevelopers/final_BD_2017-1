--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

--Asignando el status de recibido al articulo registrado
create or replace trigger respuesta_articulo
after insert on articulo
for each row
declare
  v_articulo_id articulo.articulo_id%TYPE;
  v_titulo articulo.titulo%TYPE;
  v_numero_folio articulo.folio%TYPE;
  v_fecha_estado articulo.fecha_estado%TYPE;
begin
  --Asignando valores a las varables
  v_articulo_id := :new.articulo_id;
  v_titulo := :new.titulo;
  select seq_numero_folio.nextval into v_numero_folio from dual;
  select sysdate into v_fecha_estado from dual;

  --Mensaje de recibido
  dbms_output.put_line('Hemos recibido su articulo ' || v_titulo);

  --Actualizando el registro
  update articulo
  set 
    folio = v_numero_folio,
    fecha_estado = v_fecha_estado,
    estado_articulo_id = 1 --ID del status RECIBIDO
  where articulo_id = v_articulo_id;
end;
/

create or replace trigger registra_tipo_empleado
after insert on empleado
for each row
declare
  v_empleado_id empleado.empleado_id%TYPE;
  v_nombre empleado.nombre%TYPE;
  v_es_editor empleado.es_editor%TYPE;
  v_es_revisor empleado.es_revisor%TYPE;
begin
  v_empleado_id := :new.empleado_id;
  v_nombre := :new.nombre;
  v_es_editor := :new.es_editor;
  v_es_revisor := :new.es_revisor;

  if v_es_revisor = 1 and v_es_editor = 0 then
    dbms_output.put_line('Proporcione los datos del revisor ' || v_nombre);
    exec agrega_revisor (v_empleado_id);
  elsif v_es_editor = 1 and v_es_revisor = 0 then
    dbms_output.put_line('Proporcione los datos del editor ' || v_nombre);
    exec agrega_editor (v_empleado_id);
  end if;
end;
/

create or replace trigger filtro_articulo
after insert on revision
for each row
declare
  v_calificacion revision.calificacion%TYPE;
  v_articulo_id revision.articulo_id%TYPE;
  v_promedio number(4, 2);
  v_contador number(2, 0);
begin
  v_calificacion := :new.calificacion;
  v_articulo_id := :new.articulo_id;

  select avg(calificacion) into v_promedio from revision where articulo_id = v_articulo_id;
  select count(*) into v_contador from revision where articulo_id = v_articulo_id;

  if v_contador = 3 then
    if v_promedio >= 8 then
      --Revisado
      update articulo set estado_articulo_id = 2, fecha_estado = sysdate where articulo_id = v_articulo_id;
    else
      --Rechazado
      update articulo set estado_articulo_id = 3, fecha_estado = sysdate where articulo_id = v_articulo_id;
    end if;
  end if;
end;
/
  
create or replace trigger actualiza_estado
  after insert or update of estado_articulo_id, fecha_estado on articulo
  for each row
  declare
    v_articulo_id articulo.articulo_id%TYPE;
    v_estado_articulo articulo.estado_articulo_id%TYPE;
    v_fecha_estado articulo.fecha_estado%TYPE;
  begin
    v_articulo_id := :new.articulo_id;
    v_estado_articulo := :new.estado_articulo_id;
    v_fecha_estado := :new.fecha_estado;

    if v_estado_articulo is null and v_fecha_estado is null then
      v_estado_articulo := 1;
      v_fecha_estado := sysdate;
    end if;

    insert into historial_estado_articulo (historial_estado_articulo_id, fecha_estado, articulo_id, estado_articulo_id)
      values (seq_historial_estado_articulo.nextval, v_fecha_estado, v_articulo_id, v_estado_articulo);
  end;
  /
  
create or replace trigger publica_articulo
  after update of numero_pagina on publicacion_articulo
  for each row
  declare
    v_articulo_id publicacion_articulo.articulo_id%TYPE;
  begin
    v_articulo_id := :new.articulo_id;
    --Publicado
    update articulo set estado_articulo_id = 5 where articulo_id = v_articulo_id;
  end;
  /

create or replace trigger actualiza_empleado
  after update of es_editor, es_revisor on empleado
  for each row
  declare
    v_empleado_id empleado.empleado_id%TYPE;
    v_nombre empleado.nombre%TYPE;
    v_es_editor empleado.es_editor%TYPE;
    v_es_revisor empleado.es_revisor%TYPE;
    v_contador number(10, 0);
  begin
    v_empleado_id := :new.empleado_id;
    v_nombre := :new.nombre;
    v_es_editor := :new.es_editor;
    v_es_revisor := :new.es_revisor;
    select count(*) into v_contador from articulo where editor_id = v_empleado_id;

    if v_es_editor = 1 and v_es_revisor = 1 then
      if v_contador >= 3 then
        dbms_output.put_line('Proporcione los datos del revisor ' || v_nombre);
        exec agrega_editor (v_empleado_id);
      else
        dbms_output.put_line(v_nombre || 'No puede actuar como revisor porque ha evaluado ' || v_contador ||' articulos');
        update empleado set es_revisor = 0 where empleado_id = v_empleado_id;
      end if;
    end if;
  end;
  / 