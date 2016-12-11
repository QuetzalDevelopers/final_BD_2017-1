--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create unique index idx_publicacion_titulo on publicacion(titulo_principal);

create unique index idx_suscriptor_nombre_completo on suscriptor(apellido_paterno, apellido_materno, nombre);

create unique index idx_autor_nombre_completo on autor(apellido_paterno, apellido_materno, nombre);

create unique index idx_empleado_nombre_completo on empleado(apellido_paterno, apellido_materno, nombre);

create unique index idx_articulo_titulo on articulo(titulo);