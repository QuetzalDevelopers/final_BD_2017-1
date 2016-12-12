--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create or replace procedure confirma_publicacion
  begin
    dbms_output.put_line('Ingresa el titulo de la publicacion que desea confirmar y su respectivo estado: ');
    if lower(&&estado) = 'rechazado' or lower(&estado) = 'programado'
      update articulo
        set estado_articulo_id = (
          select estado_articulo_id from estado_articulo where lower(clave) = lower(&estado)
        )
        where articulo_id = (
          select articulo_id from articulo where lower(titulo) = lower(&titulo_articulo)
        );
    else
      dbms_output.put_line('No puede actualizar a un estado que sea distinto de rechazado o programaso');
    end if;
  end;
