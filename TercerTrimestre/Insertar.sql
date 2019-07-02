-- Datos
-- Tabla TipoUsuario
insert into TipoUsuario(Descripcio) values
('Administrador'),
('Usuario');

-- Tabla TipoDocumento
insert into TipoDocumento(Descripcion) values
('Cedula'),
('Tarjeta de identidad'),
('Cedula extranjeria');

-- Tabla TipoPresentacion
insert into TipoPresentacion(Descripcion, Cantidad, UnidadMedida) values
('Paquete', 150, 'Kg'),
('Rollo', 100, 'm'),
('Caneca', 200, 'Kg'),
('Estiba', 500, 'Unidad'),
('Caja', 100, 'Kg'),
('Caja', 100, 'Unidad');


--  Tabla Textura 
insert into TexturaPapel(Descripcion) values
('form'),
('lisa'),
('lino'),
('gofrado'),
('agata'),
('cuero'),
('croco');


-- Tabla TipoMaterial
insert into TipoMaterial(Descripcion, IdTipoPresentacion) values
('Propalcolte', 1),
('Cartulina', 1),
('Carton', 4),
('Polipropileno', 2),
('Papel encuadernacion', 2),
('ColbonPapel', 3),
('Pegante adhesivo', 3),
('Anillado plastico 20mm', 5),
('Anillado plastico 25mm', 5),
('Alambre', 1),
('Ganchos legajadores', 6);

-- Tabla Tamaño
insert into Usuario(IdTipoUsuario, Nombres, Apellidos, IdTipoDocumento, NumDoc, Email, Contraseña, Estado)
values
(1, 'Johan', 'Barreto', 1, '1012854608', 'johan@gmail.com', '123456', 'Activo'),
(1, 'Camilo', 'Suarez', 1, '5465465455', 'camilo@gmail.com', '123456', 'Activo'),
(1, 'Gustavo', 'Riaño', 1, '6546464656', 'Gustavo@gmail.com', '123456', 'Activo'),
(2, 'Claudia', 'Gonzales', 1, '4654654654', 'claudia@gmail.com', '123456', 'Activo');


-- Tabla Proveedores
insert into proveedor(Nombre, NombreRepresentante, TelefonoRepresentante, Email, PaisOrigen)
values
('Yulim', 'Young Mi', '3203536415', 'young@gmail.com', 'Corea'),
('Propandina', 'Carolina Ramirez', '3203536415', 'carolina@gmail.com', 'Colombia'),
('PackFilm', 'Tatiana Suarez', '3216508945', 'tatiana@gmail.com', 'Colombia'),
('SAS Propandina', 'Luisa Castro', '3223659854', 'luisa@gmail.com', 'Colombia');


-- Tabla Empleado
insert into Empleado(Nombres, Apellidos, IdTipoDocumento, NumeroDoc, Observaciones)
values
('Andres', 'Romero', 2,'1214546', 'Sin observaciones'),
('Juliana', 'Amaya', 1,'10021246', 'Sin observaciones'),
('Camilo', 'Parra', 1,'905456', 'Sin observaciones'),
('Carmen', 'Ruiz', 1,'65464', 'Sin observaciones'),
('Etelbina', 'Hernandez', 1,'1214546', 'Sin observaciones');


-- Tabla Material
insert into Material(IdTipoMaterial, Existencias, Color, IdTextura, idProveedor)
values
(1, 150, NULL, NULL,2),
(2, 200, 'Verde,Azul,Blanco,Rojo', NULL, 2),
(3, 100, NULL, NULL,3),
(4, 150, NULL, NULL, 3),
(5, 3, 'Verde,Rojo', 3, 1),
(5, 3, 'Azul,Rojo', 4, 1),
(5, 3, 'Blanco,Azul', 2, 1),
(5, 3, 'Verde', 1, 1),
(6, 75, NULL, NULL, 4),
(7, 65, NULL, NULL, 4),
(8, 30, 'Azul,Verde,Rojo', NULL, 2),
(9, 30, 'Azul,Verde,Rojo', NULL, 2),
(10, 20, NULL, NULL, 4),
(11, 30, NULL, NULL, 4);


-- Tabla Salida
insert into salida(IdEmpleado, Fecha, Encargado) values
(1, '2019-02-20', 4),
(2, '2019-03-20', 4),
(2, '2019-03-25', 4),
(3, '2019-02-15', 4),
(4, '2019-02-20', 4),
(5, '2019-02-20', 4),
(1, '2019-09-11', 4),
(3, '2019-02-20', 4),
(2, '2019-05-23', 4),
(5, '2019-08-20', 4),
(3, '2019-02-20', 4);


-- Tabla Detalles Salida
insert into DetallesSalida(idSalida,idMaterial,Cantidad) values
(1,4, 15),
(2,4, 20),
(3,4, 25),
(4,3, 30),
(5,4, 10),
(6,7, 10),
(7,3, 5),
(8,3, 3),
(9,1, 9),
(10,1, 11),
(11,1, 15);

select*from detallessalida;
truncate table DetallesSalida;
desc Material;


