create database modulo_seguridad
/*
db_security_model: "1.0.0"
info:
  description: 
  "Gestiona el almacenamiento del modulo de seguridad del sitema de control de labores"
  
  title: db_security_model 
  version: 1.0.0

  license: "Microsoft"
    name: "Microsoft SQL server 2017 developer edition"
    url:  "https://www.microsoft.com/es-es/sql-server/sql-server-2017-pricing"

  contact: ""
    email: ""
*/

--tablas

create table S_Usuario(
id_Usuario int identity(1,1),
S_Nombre varchar(30)not null,
S_Apellido varchar(30)not null,
S_Edad int not null,
S_Tipo_Usuario varchar(5)not null,
Constraint PK_S_Usuario Primary key(id_Usuario)
)

create table S_Roles(
id_Rol int identity(1,1),
S_Nombre_rol varchar(30)not null,
S_descripcion_rol varchar(30)not null,
Constraint PK_S_Roles Primary key(id_Rol)
)

create table S_Permisos(
id_Permiso int identity(1,1),
S_Nombre_rol varchar(30)not null,
S_descripcion_rol varchar(30)not null,
Constraint PK_S_Permiso Primary key(id_Permiso)
)

/*Stablas intermedias*/
create table S_usuario_rol(
S_id_rol_usuario int identity(1,1),
S_id_Usuario int,
S_id_rol int,
Constraint FK_S_usuario_rol_usuario
FOREIGN KEY(S_id_Usuario)REFERENCES S_Usuario(id_Usuario),
Constraint FK_S_usuario_rol_rol
FOREIGN KEY(S_id_rol) REFERENCES S_Roles(id_Rol)
)

create table S_rol_permiso(
S_id_rol_permiso int identity(1,1), 
S_id_rol int,
S_id_permiso int,
Constraint FK_S_rol_permiso_rol
FOREIGN KEY(S_id_rol)REFERENCES S_Roles(id_Rol),
Constraint FK_S_rol_permiso_permiso
FOREIGN KEY(S_id_permiso) REFERENCES S_Permisos(id_Permiso)
)

/**Procedimientos almacenados**/


