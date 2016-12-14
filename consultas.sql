--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

select (e.empleado_id, e.nombre, e.apellido_paterno, e.apellido_materno, e.email, e.fecha_ingreso, r.numero_contrato, r.fin_contrato)
from empleado e, revisor r
where e.empleado_id = r.empleado_id and e.es_revisor;

select (e.empleado_id, e.nombre, e.apellido_paterno, e.apellido_materno, e.email, e.fecha_ingreso, ed.cedula, ed.nombre_maestria_doctorado)
from empleado e, editor ed
where e.empleado_id = ed.empleado_id and e.es_editor;

select a.articulo_id, a.nombre, r.promedio
from articulo a, (
	select articulo_id, avg(calificacion) as promedio
	from revision
	group by articulo_id
) r
where r.articulo_id = a.articulo_id;

connect qn_proy_user/user123

select * from v_articulo;
select * from v_publicacion;