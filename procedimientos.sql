--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create or replace procedure confirma_publicacion(a_editor_id in editor.empleado_id%TYPE)
  declare
  cursor c_editores is
    select empleado_id from editor;
  v_editor_id editor.empleado_id%TYPE;
  v_bandera boolean;
  begin
    open c_editores;
    v_bandera = false;
    loop
      fetch c_editores into v_editor_id;
      exit when c_editores%NOTFOUND;
      if v_editor_id = a_editor_id then
        v_bandera = true;
      end if; 
    end loop;

    if v_badera then
      dbms_output.put_line('Ingresa el id del articulo que desea confirmar y su respectivo estado: ');
      if lower(&&estado) = 'rechazado' or lower(&estado) = 'programado'
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
  end;