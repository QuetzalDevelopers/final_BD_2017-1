--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create or replace view v_articulo(articulo_id, folio, titulo, sinopsis, area_interes, nombre_autor, apellido_paterno_autor, apellido_materno_autor)
as select a.articulo_id, a.folio, a.titulo, a.sinopsis, ai.descripcion, au.nombre, au.apellido_paterno, au.apellido_materno
from articulo a, area_interes ai, autor_articulo aa, autor au
where 
  a.area_interes_id = ai.area_interes_id and 
  aa.articulo_id = a.articulo_id and 
  aa.autor_id = au.autor_id;

create or replace view v_publicacion(publicacion_id, titulo_principal, fecha_publicacion, articulo, nombre_autor, apellido_paterno_autor, apellido_materno_autor)
as select p.publicacion_id, p.titulo_principal, p.fecha_publicacion, a.titulo, au.nombre, au.apellido_paterno, au.apellido_materno
from publicacion p, publicacion_articulo pa, articulo a, autor_articulo aa, autor au
where
  p.publicacion_id = pa.publicacion_id and
  pa.articulo_id = a.articulo_id and
  a.articulo_id = aa.articulo_id and
  aa.autor_id = au.autor_id;