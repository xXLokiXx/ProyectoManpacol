-- Tabla Tipo Usuario
CREATE TABLE `tipousuario` (
  `Descripcion` varchar(60) NOT NULL,
   PRIMARY KEY (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Proveedor
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(70) DEFAULT NULL,
  `NombreRepresentante` varchar(100) DEFAULT NULL,
  `TelefonoRepresentante` varchar(60) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `PaisOrigen` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Tipo Documento
CREATE TABLE `tipodocumento` (
  `Descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Empleado
CREATE TABLE `empleado` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `IdTipoDocumento` varchar(11) NOT NULL,
  `NumeroDoc` varchar(30) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
   PRIMARY KEY (`Id`),
  INDEX `fk_TipoDoc_idx` (`IdTipoDocumento` ASC),
  CONSTRAINT `fk_TipoDoc`
    FOREIGN KEY (`IdTipoDocumento`)
    REFERENCES `tipodocumento` (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Tipo Presentacion
CREATE TABLE `tipopresentacion` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `UnidadMedida` enum('Kg','m','cm','Unidad') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Tipo Material
CREATE TABLE `tipomaterial` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL,
  `IdTipoPresentacion` int(11) NOT NULL,
    PRIMARY KEY (`id`),
  INDEX `fk_Presentacion_idx` (`IdTipoPresentacion` ASC),
  CONSTRAINT `fk_Presentacion`
    FOREIGN KEY (`IdTipoPresentacion`)
    REFERENCES `tipopresentacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Textura Papel
CREATE TABLE `texturapapel` (
  `Descripcion` varchar(45) NOT NULL,
   PRIMARY KEY (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Color
CREATE TABLE `color` (
  `Descripcion` varchar(45) NOT NULL,
   PRIMARY KEY (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Material
CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `IdTipoMaterial` int(11) NOT NULL,
  `Existencias` int(11) DEFAULT NULL,
  `Color` varchar(45) NOT NULL,
  `IdTextura` varchar(45) NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TipoMat_idx` (`IdTipoMaterial` ASC),
  INDEX `fk_Proveedor_idx` (`IdProveedor` ASC),
  INDEX `fk_Textura_idx` (`IdTextura` ASC),
  INDEX `fk_Tamaños_idx` (`Color` ASC),
  CONSTRAINT `fk_TipoMat`
    FOREIGN KEY (`IdTipoMaterial`)
    REFERENCES `tipomaterial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Textura`
    FOREIGN KEY (`IdTextura`)
    REFERENCES `texturapapel` (`Descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Colores`
    FOREIGN KEY (`Color`)
    REFERENCES `color` (`Descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Entrada
CREATE TABLE `entrada` (
  `id` int(11) NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `fk_proveedorr_idx` (`IdProveedor` ASC),
  CONSTRAINT `fk_proveedor`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Usuario
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `IdTipoUsuario` varchar(60) NOT NULL,
  `name` varchar(255)  NOT NULL,
  `Apellidos` varchar(100)  NOT NULL,
  `IdTipoDocumento` varchar(60)  NOT NULL,
  `NumDoc` varchar(20)  NOT NULL,
  `email` varchar(255)  NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255)   NOT NULL,
  `remember_token` varchar(100)  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Estado` enum('Activo','Inactivo')  DEFAULT 'Activo',
    PRIMARY KEY (`id`),
  INDEX `fk_TipoDoc_idx` (`IdTipoDocumento` ASC),
  INDEX `fk_TipoUsuario_idx` (`IdTipoUsuario` ASC),
  CONSTRAINT `fk_TipoDocc`
    FOREIGN KEY (`IdTipoDocumento`)
    REFERENCES `tipodocumento` (`Descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoUsuario`
    FOREIGN KEY (`IdTipoUsuario`)
    REFERENCES `tipousuario` (`Descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Salida
CREATE TABLE `salida` (
  `id` int(11) NOT NULL,
  `IdEmpleado` int(11) NOT NULL,
  `IdEncargado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`idS`),
  INDEX `fk_Operario_idx` (`IdEmpleado` ASC),
  INDEX `fk_encargado_idx` (`IdEncargado` ASC),
  CONSTRAINT `fk_Operario`
    FOREIGN KEY (`IdEmpleado`)
    REFERENCES `empleado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encargado1`
    FOREIGN KEY (`IdEncargado`)
    REFERENCES `Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Detalles Salida
CREATE TABLE `detallessalida` (
  `idSalida` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSalida`, `idMaterial`),
  INDEX `fk_DetallesEx_Extracciones1_idx` (`idSalida` ASC),
  INDEX `fk_DetallesEx_Materialess_idx` (`idMaterial` ASC),
  CONSTRAINT `fk_DetallesEx_Extracciones1`
    FOREIGN KEY (`idSalida`)
    REFERENCES `Salida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesEx_Materiales :D1`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `Material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Material Dañado
CREATE TABLE `materialdaniado` (
  `idMaterial` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Descripcion` VARCHAR(45) NULL,
   PRIMARY KEY (`idMaterial`),
  CONSTRAINT `fk_MaterialDañado_Material1`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla Detalles Entrada
CREATE TABLE `detallesentrada` (
  `idEntrada` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`, `idEntrada`),
  INDEX `fk_Material_has_RegistroEntrada_RegistroEntrada1_idx` (`idEntrada` ASC),
  INDEX `fk_Material_has_RegistroEntrada_Material1_idx` (`idMaterial` ASC),
  CONSTRAINT `fk_Material_has_RegistroEntrada_Material1`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Material_has_RegistroEntrada_RegistroEntrada1`
    FOREIGN KEY (`idEntrada`)
    REFERENCES `entrada` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;










