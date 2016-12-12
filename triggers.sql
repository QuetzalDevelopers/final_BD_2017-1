--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

--Asignando el status de recibido al articulo registrado
create or replace trigger respuesta_articulo
after insert of (articulo_id, titulo, sinopsis, area_interes_id) on articulo
for each row
declare
  v_articulo_id number(10, 0);
  v_titulo varchar2(10);
  v_numero_folio number(18, 0);
  v_fecha_estado date;
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
after insert of (empleado_id, nombre, apellido_paterno, apellido_materno, fecha_registro, es_editor, es_revisor)
for each row
declare
  v_empleado_id number(10, 0);
  v_nombre varchar2(10);
  v_es_editor boolean;
  v_es_revisor boolean;
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