-- Base de datos BodegaManpaCol
create database BodegaManpaCol;
use BodegaManpaCol;
-- Tabla Tipo de documento
create table TipoDocumento(
Id int not null auto_increment,
Descripcion varchar(60),
primary key(Id)
);

 -- Tabla Tipo de usuario
 create table TipoUsuario(
 Id int not null auto_increment,
 Descripcio varchar(60),
 primary key(Id)
 );
 
 -- Tabla Tipo de presentacion del material
 create table TipoPresentacion(
 Id int not null auto_increment,
 Descripcion varchar(80),
 Cantidad int,
 UnidadMedida ENUM('Kg','m','cm'),
 primary key(ID)
 );
 
 -- Tabla Tipo de material
 create table TipoMaterial(
 Id int not null auto_increment,
 Descripcion varchar(60),
 IdTipoPresentacion int not null,
 primary key(Id),
 foreign key(IdTipoPresentacion) references TipoPresentacion(Id)
 );
 
 -- Tabla Usuarios
 create table Usuario (
 Id int not null auto_increment,
 IdTipoUsuario int not null,
 Nombres varchar(60),
 Apellidos varchar(60),
 IdTipoDocumento int not null,
 NumDoc varchar(30),
 Email varchar(100),
 Contraseña varchar(100),
 Estado ENUM('Activo','Inactivo'),
 primary key(Id),
 foreign key(IdTipoUsuario) references TipoUsuario(Id),
 foreign key(IdTipoDocumento) references TipoDocumento(Id)
 );
 
 
 -- Tabla Tamaños
 create table Tamaño(
 Id int not null auto_increment,
 Descripcion varchar(60),
 primary key(Id)
 );
 
 -- Tabla Texturas
 create table TexturaPapel(
 Id int not null auto_increment,
 Descripcion varchar(60),
 primary key(Id)
 );
 
 -- Tabla Proveedores
 create table Proveedor(
 Id int not null auto_increment,
 Nombre varchar(70),
 NombreRepresentante varchar(100),
 TelefonoRepresentante varchar(60),
 Email varchar(80),
 PaisOrigen varchar(80),
 primary key(Id)
 );
 
 
 -- Tabla Empleados
 create table Empleado(
 Id int not null auto_increment,
 Nombres varchar(60),
 Apellidos varchar(60),
 IdTipoDocumento int not null,
 NumeroDoc varchar(30),
 Observaciones varchar(300),
 primary key(Id),
 foreign key(IdTipoDocumento) references TipoDocumento(Id)
 );
 
 -- Tabla Materiales
 create table Material(
 Id int not null auto_increment,
 IdTipoMaterial int not null,
 Existencias int,
 IdTamaño int not null,
 Color varchar(60),
 IdTextura int null,
 IdProveedor int not null,
 primary key(Id),
 foreign key(IdTipoMaterial) references TipoMaterial(Id),
 foreign key(IdTamaño) references Tamaño(Id),
 foreign key(IdTextura) references TexturaPapel(Id),
 foreign key(IdProveedor) references Proveedor(Id) 
 );
 
 
 -- Tabla Salida del material
 create table Salida(
 Id int not null auto_increment,
 IdEmpleado int not null,
 Fecha datetime,
 Encargado int not null,
 primary key(Id),
 foreign key(IdEmpleado) references Empleado(Id),
 foreign key(Encargado) references Usuario(ID)
 );
 
 
 -- Tabla de Detalles de la salida
 create table DetallesSalida(
 idSalida int not null,
 idMaterial int not null,
 Cantidad int,
 
 foreign key(idSalida) references Salida(Id), 
 foreign key(idMaterial) references Material(Id),
 primary key(idMaterial,idSalida)
 );
 
 

