--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create sequence seq_publicacion
  start with 1
  increment by 1;

create sequence seq_suscriptor
  start with 1
  increment by 1;

create sequence seq_peticion
  start with 1
  increment by 1;

create sequence seq_autor
  start with 1
  increment by 1;

create sequence seq_area_interes
  start with 1
  increment by 1;

create sequence seq_estado_articulo
  start with 1
  increment by 1;

create sequence seq_empleado
  start with 1
  increment by 1;

create sequence seq_articulo
  start with 1
  increment by 1;

create sequence seq_autor_articulo
  start with 1
  increment by 1;

create sequence seq_historial_estado_articulo
  start with 1
  increment by 1;

create sequence seq_publicacion_articulo
  start with 1
  increment by 1;

create sequence seq_revisor_area
  start with 1
  increment by 1;

create sequence seq_numero_folio
  start with 1
  increment by 1
  maxvalue 999999999999999999
  cycle;