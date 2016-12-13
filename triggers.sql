--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

--Asignando el status de recibido al articulo registrado
create or replace trigger respuesta_articulo
after insert of (articulo_id, titulo, sinopsis, area_interes_id) on articulo
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

create or replace trigger registra_tipo_empleado
after insert of (empleado_id, nombre, apellido_paterno, apellido_materno, fecha_registro, es_editor, es_revisor) on empleado
for each row
declare
  v_empleado_id empleado.empleado_id%TYPE;
  v_nombre empleado.nombre%TYPE;
  v_es_editor empleado.es_editor%TYPE;
  v_es_revisor empleado.es_revisor%TYPE;
begin
  v_empleado_id := :new.empleado_id;
  v_nombre := :new.nombre;

  if v_es_revisor and not v_es_editor then
    dbms_output.put_line('Proporcione los datos del revisor ' || v_nombre);

    insert into revisor (empleado_id, numero_contrato, fin_contrato)
    values (v_empleado_id, to_number(&numero_contrato), to_date(&fin_contrato, "DD/MM/YYYY"));

  else if v_es_editor and not v_es_revisor then
    dbms_output.put_line('Proporcione los datos del editor ' || v_nombre);

    insert into editor (empleado_id, numero_contrato, fin_contrato)
    values (v_empleado_id, to_number(&cedula), &nombre_maestria_o_doctorado);
  end if;
end;

create or replace trigger filtro_articulo
after insert of (revision_id, calificacion, articulo_id, revisor_id) on revision
for each row
declare
  v_calificacion revision.calificacion%TYPE;
  v_articulo_id revision.articulo_id%TYPE;
  v_promedio number(4, 2);
  v_contador number(2, 0);
begin
  v_calificacion := :new.calificacion;
  v_articulo_id := :new.articulo_id;

  v_promedio := select avg(calificacion) from revision where articulo_id = v_articulo_id;
  v_contador := select count(*) from revision where articulo_id = v_articulo_id;

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

create or replace trigger actualiza_estado 
  after insert or update of (estado_articulo_id, fecha_estado) on articulo
  for each row
  declare
    v_articulo_id articulo.articulo_id%TYPE;
    v_estado_articulo_nuevo articulo.estado_articulo_id%TYPE;
    v_fecha_estado_nuevo articulo.fecha_estado%TYPE;
  begin
    v_articulo_id := :new.articulo_id;
    v_estado_articulo_nuevo := :new.estado_articulo_id;
    v_fecha_estado_nuevo := :new.fecha_estado;

    insert into historial_estado_articulo (historial_estado_articulo_id, fecha_estado, articulo_id, estado_articulo_id)
      values (seq_historial_estado_articulo.nextval, v_fecha_estado_nuevo, v_articulo_id, v_estado_articulo_nuevo);
  end;

create or replace trigger publica_articulo
  after insert of (numero_pagina) on publicacion_articulo
  for each row
  declare
    v_articulo_id publicacion_articulo.articulo_id%TYPE;
  begin
    v_articulo_id := :new.articulo_id;
    --Publicado
    update articulo set estado_articulo_id = 5 where articulo_id = v_articulo_id;
  end;

create or replace trigger actualiza_empleado
  after update (es_editor, es_revisor) on empleado
  for each row
  declare
    v_empleado_id empleado.empleado_id%TYPE;
    v_nombre empleado.nombre%TYPE;
    v_es_editor empleado.es_editor%TYPE;
    v_es_revisor empleado.es_revisor%TYPE;
    v_contador number(10, 0);
  begin
    v_empleado_id := :new.empleado_id;
    v_es_editor := :new.es_editor;
    v_es_revisor := :new.es_revisor;
    v_contador := select count(*) from articulo where editor_id = v_empleado_id;

    if v_es_editor and v_es_revisor then
      if v_contador >= 3 then
        dbms_output.put_line('Proporcione los datos del revisor ' || v_nombre);

        insert into revisor (empleado_id, numero_contrato, fin_contrato)
        values (v_empleado_id, to_number(&numero_contrato), to_date(&fin_contrato, "DD/MM/YYYY"));
      else
        dbms_output.put_line(v_nombre || 'No puede actuar como revisor porque ha evaluado ' || v_contador ||' articulos');
        update empleado set v_es_revisor = false where empleado_id = v_empleado_id;
      end if;
    end if;
  end;