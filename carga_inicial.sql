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
insert into suscriptor (suscriptor_id, nombre, apellido_paterno, email, fecha_suscripcion, duracion_vigencia, calle, numero, colonia, codigo_postal, municipio, estado) values(seq_suscriptor.nextval, 'RYAN', 'COOPER', 'street_king@gmail.com', sysdate, 6, 'BOULEVARD', '100', 'BROKEN DREAMS', '21893', 'DENVER', 'COLORADO');
insert into suscriptor (suscriptor_id, nombre, apellido_paterno, email, fecha_suscripcion, duracion_vigencia, calle, numero, colonia, codigo_postal, municipio, estado) values(seq_suscriptor.nextval, 'KAROL', 'MONROE', 'drag_queen@gmail.com', sysdate, 6, 'BOULEVARD', '100', 'BROKEN DREAMS', '21893', 'DENVER', 'COLORADO');

insert into peticion (peticion_id, fecha_envio, publicacion_id, suscriptor_id) values(seq_peticion.nextval, to_date('01/01/2017', 'DD/MM/YYYY'), 1, 1);
insert into peticion (peticion_id, fecha_envio, publicacion_id, suscriptor_id) values(seq_peticion.nextval, to_date('01/02/2017', 'DD/MM/YYYY'), 1, 2);
insert into peticion (peticion_id, fecha_envio, publicacion_id, suscriptor_id) values(seq_peticion.nextval, to_date('01/01/2017', 'DD/MM/YYYY'), 2, 1);
insert into peticion (peticion_id, fecha_envio, publicacion_id, suscriptor_id) values(seq_peticion.nextval, to_date('01/01/2017', 'DD/MM/YYYY'), 3, 3);

insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'MARIO', 'PLATTINI', 'ADMINISTRADOR DE BASES', 'el_plattini@gmail.com', 'RA-MA');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'RAJKUMAR', 'BUYYA', 'ARQUITECTO DE SOFTWARE', 'pro_software@gmail.com', 'PRENTICE-HALL');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'MARK ELLIOT', 'ZUCKERBERG', 'DESARROLLADOR', 'face_developer@gmail.com', 'FACEBOOK');
insert into autor (autor_id, nombre, apellido_paterno, ocupacion, email, empresa_escuela) values(seq_autor.nextval, 'LUIS', 'DE LA PEÑA', 'FISICO', 'lpe_fisica@gmail.com', 'UNAM');

insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'BD', 'BASES DE DATOS');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'PR', 'PROGRAMACION');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'AN', 'ANALISIS DE SITEMAS DE SOFTWARE');
insert into area_interes (area_interes_id, clave, descripcion) values(seq_area_interes.nextval, 'HW', 'HARDWARE');

insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'RECIBIDO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'REVISADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'RECHAZADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'PROGRAMADO');
insert into estado_articulo (estado_articulo_id, clave) values (seq_estado_articulo.nextval, 'PUBLICADO');

insert into empleado (empleado_id, nombre, apellido_paterno, fecha_registro, es_editor, es_revisor) values (seq_empleado.nextval, 'NATASHA', 'ROMANOFF', sysdate, 0, 0);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, fecha_registro, es_editor, es_revisor) values (seq_empleado.nextval, 'ERICK', 'ROMERO', 'ZEPEDA', sysdate, 1, 0);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, fecha_registro, es_editor, es_revisor) values (seq_empleado.nextval, 'LILIANA', 'CASTILLO', 'ZURITA', sysdate, 0, 1);

insert into articulo (articulo_id, titulo, sinopsis, area_interes_id) values(seq_articulo.nextval, 'PROS Y CONTRAS DE SQLPLUS', 'LAS VENTAJAS Y DESVENTAAS DEL USO DEL MANEJADOR DE BASES DE DATOS SQLPLUS', 1);
insert into articulo (articulo_id, titulo, sinopsis, area_interes_id) values(seq_articulo.nextval, 'INTRODUCCION', 'UNA INTRODUCCION A LA PROGRAMACION DE PROCESOS PARALELOS', 2);
insert into articulo (articulo_id, titulo, sinopsis, area_interes_id) values(seq_articulo.nextval, 'JAVASCRIPT O PHP', 'LAS VENTAJAS Y DESVENTAAS DE USAR JAVASCRITP O PHP EN UN SITIO WEB', 3);
insert into articulo (articulo_id, titulo, sinopsis, area_interes_id) values(seq_articulo.nextval, 'UN NUEVO HORIZONTE', 'UNA BREVE DESCRIPCION DE LA MECANICA CUANTICA Y SUS APLICACIONES EN LA COMPUTACION', 4);

insert into autor_articulo (autor_articulo_id, autor_id, articulo_id) values (seq_autor_articulo.nextval, 1, 1);
insert into autor_articulo (autor_articulo_id, autor_id, articulo_id) values (seq_autor_articulo.nextval, 2, 2);
insert into autor_articulo (autor_articulo_id, autor_id, articulo_id) values (seq_autor_articulo.nextval, 3, 3);
insert into autor_articulo (autor_articulo_id, autor_id, articulo_id) values (seq_autor_articulo.nextval, 4, 4);

insert into publicacion_articulo (publicacion_articulo_id, publicacion_id, articulo_id) values (seq_publicacion_articulo.nextval, 1, 1);
insert into publicacion_articulo (publicacion_articulo_id, publicacion_id, articulo_id) values (seq_publicacion_articulo.nextval, 3, 3);

insert into revisor_area (revisor_area_id, anios_experiencia, area_interes_id, revisor_id) values (seq_revisor_area.nextval, 5, 2, 3);

insert into revision (revision_id, calificacion, articulo_id, revisor_id) values (seq_revision.nextval, 8, 2, 3);