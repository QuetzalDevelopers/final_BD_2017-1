--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect qn_proy_admin/admin123

create table publicacion(
  publicacion_id        number(10, 0) not null,
  titulo_principal      varchar2(30)  not null,
  fecha_publicacion     date          not null,
  ejemplares_generados  number(7, 0)  not null,
  ejemplares_vendidos   number(7, 0)  null,
  anio_publicacion as(to_number(to_char(fecha_publicacion, 'YYYY'))) virtual,
  numero_bimestre as(round(to_number(to_char(fecha_publicacion, 'MM')) / 6)) virtual,
  constraint publicacion_pk primary key (publicacion_id)
);

create table suscriptor(
  suscriptor_id     number(10, 0) not null,
  nombre            varchar2(40)  not null,
  apellido_paterno  varchar2(20)  not null,
  apellido_materno  varchar2(20)  null,
  email             varchar2(30)  not null,
  fecha_suscripcion date          not null,
  duracion_vigencia number(2, 0)  not null,
  calle             varchar2(20)  not null,
  numero            varchar2(3)   not null,
  colonia           varchar2(20)  not null,
  codigo_postal     varchar2(5)   not null,
  municipio         varchar2(20)  not null,
  estado            varchar2(20)  not null,
  constraint suscriptor_pk primary key (suscriptor_id)
);

create table peticion(
  peticion_id     number(10, 0) not null,
  fecha_envio     date          not null,
  publicacion_id  number(10, 0) not null,
  suscriptor_id   number(10, 0) not null,
  constraint peticion_pk primary key (peticion_id),
  constraint peticion_publicacion_fk foreign key (publicacion_id) references publicacion(publicacion_id),
  constraint peticion_suscriptor_fk foreign key (suscriptor_id) references suscriptor(suscriptor_id)
);

create table autor(
  autor_id          number(10, 0) not null,
  nombre            varchar2(40)  not null,
  apellido_paterno  varchar2(20)  not null,
  apellido_materno  varchar2(20)  null,
  ocupacion         varchar2(30)  not null,
  email             varchar2(30)  not null,
  empresa_escuela   varchar2(20)  not null,
  constraint autor_pk primary key (autor_id)
);

create table area_interes(
  area_interes_id number(10, 0) not null,
  clave           varchar2(2)   not null,
  descripcion     varchar2(50)  not null,
  constraint area_interes_pk primary key (area_interes_id),
  constraint area_interes_clave_uni unique (clave)
);

create table estado_articulo(
  estado_articulo_id  number(10, 0) not null,
  clave               varchar2(10)  not null,
  descripcion         varchar2(30)  null,
  constraint estado_articulo_pk primary key (estado_articulo_id),
  constraint estado_articulo_clave_uni unique (clave)
);

create table empleado(
  empleado_id       number(10, 0) not null,
  nombre            varchar2(40)  not null,
  apellido_paterno  varchar2(20)  not null,
  apellido_materno  varchar2(20)  null,
  email             varchar2(30)  null,
  fecha_registro    date          not null,
  es_editor         int           not null,
  es_revisor        int           not null,
  constraint empleado_pk primary key (empleado_id),
  constraint empleado_es_ed_ch check (es_editor = 1 or es_editor = 0),
  constraint empleado_es_re_ch check (es_revisor = 1 or es_revisor = 0)
);

create table editor(
  empleado_id               number(10, 0) not null,
  cedula                    number(10, 0) not null,
  nombre_maestria_doctorado varchar2(20)  not null,
  constraint editor_pk primary key (empleado_id),
  constraint editor_empleado_fk foreign key (empleado_id) references empleado(empleado_id),
  constraint editor_cedula_uni unique (cedula)
);

create table revisor(
  empleado_id     number(10, 0) not null,
  numero_contrato number(10, 0)  not null,
  fin_contrato    date          not null,
  constraint revisor_pk primary key (empleado_id),
  constraint revisor_empleado_fk foreign key (empleado_id) references empleado(empleado_id)
);

create table articulo(
  articulo_id         number(10, 0) not null,
  folio               number(18, 0) null,
  titulo              varchar2(30)  not null,
  sinopsis            varchar2(100) not null,
  fecha_estado        date          null,
  area_interes_id     number(10, 0) not null,
  estado_articulo_id  number(10, 0) null,
  editor_id           number(10, 0) null,
  constraint articulo_pk primary key (articulo_id),
  constraint articulo_area_interes_fk foreign key (area_interes_id) references area_interes(area_interes_id),
  constraint articulo_estado_articulo_fk foreign key (estado_articulo_id) references estado_articulo(estado_articulo_id),
  constraint articulo_editor_fk foreign key (editor_id) references editor(empleado_id),
  constraint articulo_folio_uni unique (folio)
);

create table autor_articulo(
  autor_articulo_id number(10, 0) not null,
  autor_id          number(10, 0) not null,
  articulo_id       number(10, 0) not null,
  constraint autor_articulo_pk primary key (autor_articulo_id),
  constraint autor_articulo_autor_fk foreign key (autor_id) references autor(autor_id),
  constraint autor_articulo_articulo_fk foreign key (articulo_id) references articulo(articulo_id)
);

create table historial_estado_articulo(
  historial_estado_articulo_id  number(10, 0) not null,
  fecha_estado                  date          not null,
  articulo_id                   number(10, 0) not null,
  estado_articulo_id            number(10, 0) not null,
  constraint hist_est_art_pk primary key (historial_estado_articulo_id),
  constraint his_est_art_art_fk foreign key (articulo_id) references articulo(articulo_id),
  constraint hist_est_art_est_art_fk foreign key (estado_articulo_id) references estado_articulo(estado_articulo_id)
);

create table pdf(
  articulo_id number(10, 0)   not null,
  clave       varchar2(2)     not null,
  archivo     blob            not null,
  constraint pdf_pk primary key (articulo_id, clave),
  constraint pdf_articulo_fk foreign key (articulo_id) references articulo(articulo_id),
  constraint pdf_clave_uni unique (clave)
);

create table publicacion_articulo(
  publicacion_articulo_id number(10, 0) not null,
  numero_pagina           number(5, 0)  null,
  publicacion_id          number(10, 0) not null,
  articulo_id             number(10, 0) not null,
  constraint pub_art_pk primary key (publicacion_articulo_id),
  constraint pub_art_pub_fk foreign key (publicacion_id) references publicacion(publicacion_id),
  constraint pub_art_art_fk foreign key (articulo_id) references articulo(articulo_id)
);

create table revisor_area(
  revisor_area_id   number(10, 0) not null,
  anios_experiencia number(3, 0)  not null,
  area_interes_id   number(10, 0) not null,
  revisor_id        number(10, 0) not null,
  constraint rev_are_pk primary key (revisor_area_id),
  constraint rev_are_are_int_fk foreign key (area_interes_id) references area_interes(area_interes_id),
  constraint rev_are_rev_fk foreign key (revisor_id) references revisor(empleado_id)
);

create table revision(
  revision_id   number(10, 0) not null,
  calificacion  number(4, 2)  not null,
  articulo_id   number(10, 0) not null,
  revisor_id    number(10, 0) not null,
  constraint revision_pk primary key (revision_id),
  constraint revision_articulo_fk foreign key (articulo_id) references articulo(articulo_id),
  constraint revision_revisor_fk foreign key (revisor_id) references revisor(empleado_id)
);