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