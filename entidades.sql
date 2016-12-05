connect qn_proy_admin/admin123

create table publicacion(
  publicacion_id        number(10, 0) not null,
  titulo_principal      varchar2(10)  not null,
  fecha_publicacion     date          not null,
  numero_bimestre       number(2, 0)  not null,
  anio_publicacion      number(4, 0)  not null,
  ejemplares_generados  number(7, 0)  not null,
  ejemplares_vendidos   number(7, 0)  null,

  constraint publicacion_pk primary key (publicacion_id)
);

create table suscriptor(
  suscriptor_id     number(10, 0) not null,
  nombre            varchar2(20)  not null,
  apellido_paterno  varchar2(10)  not null,
  apellido_materno  varchar2(10)  null,
  email             varchar2(10)  not null,
  fecha_suscripcion date          not null,
  duracion_vigencia number(2, 0)  not null,
  calle             varchar2(10)  not null,
  numero            varchar2(2)   not null,
  colonia           varchar2(10)  not null,
  codigo_postal     varchar2(5)   not null,
  municipio         varchar2(10)  not null,
  estado            varchar2(10)  not null,

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
  nombre            varchar2(20)  not null,
  apellido_paterno  varchar2(10)  not null,
  apellido_materno  varchar2(10)  not null,
  ocupacion         varchar2(10)  not null,
  email             varchar2(10)  not null,
  empresa_escuela   varchar2(20)  not null,

  constraint autor_pk primary key (autor_id)
);

create table area_interes(
  area_interes_id number(10, 0) not null,
  clave           varchar2(5)   not null,
  descripcion     varchar2(30)  not null,

  constraint area_interes_pk primary key (area_interes_id)
);

create table estado_articulo(
  estado_articulo_id  number(10, 0) not null,
  clave               varchar2(5)   not null,
  descripcion         varchar2(30)  not null,

  constraint estado_articulo_pk primary key (estado_articulo_id)
);

create table empleado(
  empleado_id       number(10, 0) not null,
  nombre            varchar2(20)  not null,
  apellido_paterno  varchar2(10)  not null,
  apellido_materno  varchar2(10)  not null,
  email             varchar2(10)  not null,
  fecha_registro    date          not null,

  constraint empleado_pk primary key (empleado_id)
);

create table editor(
  empleado_id               number(10, 0) not null,
  cedula                    number(10, 0) not null,
  nombre_maestria_doctorado varchar2(10)  not null,

  constraint editor_pk primary key (empleado_id),
  constraint editor_empleado_fk foreign key (empleado_id) references empleado(empleado_id)
);