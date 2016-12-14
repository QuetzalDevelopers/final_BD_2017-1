--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create or replace procedure confirma_publicacion(a_editor_id in editor.empleado_id%TYPE) as
  cursor c_editores is
    select empleado_id from editor;
  v_editor_id editor.empleado_id%TYPE;
  v_bandera int;
  begin
    open c_editores;
    v_bandera := 0;
    loop
      fetch c_editores into v_editor_id;
      exit when c_editores%NOTFOUND;
      if v_editor_id = a_editor_id then
        v_bandera := 1;
      end if; 
    end loop;

    if v_bandera = 1 then
      dbms_output.put_line('Ingresa el id del articulo que desea confirmar y su respectivo estado: ');
      if lower(&&estado) = 'rechazado' or lower(&estado) = 'programado' then
        update articulo
          set estado_articulo_id = (
            select estado_articulo_id from estado_articulo where lower(clave) = lower(&estado)
          ), editor_id = a_editor_id
          where articulo_id = &articulo_id;
      else
        dbms_output.put_line('No puede actualizar a un estado que sea distinto de rechazado o programado');
      end if;
    else
      dbms_output.put_line('No encontramos su id en el registro de editores :(');
    end if;
    commit;  
  end;
  /

create or replace procedure agrega_revisor(a_empleado_id in empleado.empleado_id%TYPE) as
  begin
    insert into revisor (empleado_id, numero_contrato, fin_contrato)
      values (a_empleado_id, seq_numero_contrato.nextval, /*to_date(&fin_de_contrato, "DD/MM/YYYY")*/sysdate + (5*365));
    commit;
  end;
  /
 
create or replace procedure agrega_editor(a_empleado_id in empleado.empleado_id%TYPE) as
  begin
    insert into editor (empleado_id, cedula, nombre_maestria_doctorado) 
      values (a_empleado_id, to_number(&cedula), &nombre_maestria_o_doctorado);
    commit;
  end;
  /