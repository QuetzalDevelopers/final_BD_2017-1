--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

insert into publicacion (publicacion_id, titulo_principal, fecha_publicacion, ejemplares_generados) values (seq_publicacion.nextval, 'SQLPLUS', sysdate, 100);
insert into publicacion (publicacion_id, titulo_principal, fecha_publicacion, ejemplares_generados) values (seq_publicacion.nextval, 'PROGRAMACION PARALELA', sysdate, 200);
insert into publicacion (publicacion_id, titulo_principal, fecha_publicacion, ejemplares_generados) values (seq_publicacion.nextval, 'DESARROLLO WEB', sysdate, 500);
insert into publicacion (publicacion_id, titulo_principal, fecha_publicacion, ejemplares_generados) values (seq_publicacion.nextval, 'COMPUTACION CUANTICA', sysdate, 400);

insert into suscriptor (suscriptor_id, nombre, apellido_paterno, apellido_materno, email, fecha_suscripcion, duracion_vigencia, calle, numero, colonia, codigo_postal, municipio, estado) values(seq_suscriptor.nextval, 'AXEL', 'RODRIGUEZ', 'ESTRADA', 'tmw@gmail.com', sysdate, 12, 'CALLE DRAGON', '20', 'PADIERNA', '14235', 'TLALPAN', 'CDMX');
insert into suscriptor (suscriptor_id, nombre, apellido_paterno, apellido_materno, email, fecha_suscripcion, duracion_vigencia, calle, numero, colonia, codigo_postal, municipio, estado) values(seq_suscriptor.nextval, 'MONICA', 'RAMIREZ', 'CIENFUEGOS', 'lbdb@gmail.com', sysdate, 11, 'MATAMOROS', '34', 'LA PLATA', '14225', 'PACHUCA', 'HIDALGO');

insert into peticion

insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'MARIO', 'PLATTINI', 'ADMINISTRADOR DE BASES', 'el_plattini@gmail.com');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'RAJKUMAR', 'BUYYA', 'ARQUITECTO DE SOFTWARE', 'pro_software@gmail.com');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'MARK ELLIOT', 'ZUCKERBERG', 'DESARROLLADOR', 'face_developer@gmail.com');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'LUIS', 'DE LA PEÑA', 'FISICO', 'lpe_fisica@gmail.com');

insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'BD', 'BASES DE DATOS');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'PR', 'PROGRAMACION');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'AN', 'ANALISIS DE SITEMAS DE SOFTWARE');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'HW', 'HARDWARE');

insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'RECIBIDO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'REVISADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'RECHAZADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'PROGRAMADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'PUBLICADO');

insert into articulo (articulo_id, titulo, sinopsis, area_interes_id) values(seq_articulo.nextval, 'PROS Y CONTRAS DE SQLPLUS', 'LAS VENTAJAS Y DESVENTAAS DEL USO DEL MANEJADOR DE BASES DE DATOS SQLPLUS', 1);