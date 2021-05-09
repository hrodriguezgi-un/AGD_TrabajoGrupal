DROP DATABASE IF EXISTS hospitalizacion;

CREATE DATABASE hospitalizacion CHARACTER SET utf8;

USE hospitalizacion;

-- hospitalizacion.departamentos definition
CREATE TABLE `departamentos` (
  `cod` varchar(3) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.municipios definition
CREATE TABLE `municipios` (
  `cod` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.causa_externa definition
CREATE TABLE `causa_externa` (
  `cod` int(4) NOT NULL,
  `causa_externa` varchar(100) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.diagnostico definition
CREATE TABLE `diagnostico` (
  `cod` varchar(4) NOT NULL,
  `diagnostico` varchar(500) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.eas definition
CREATE TABLE `eas` (
  `cod` varchar(6) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.ips definition
CREATE TABLE `ips` (
  `cod` varchar(12) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.tipo_edad definition
CREATE TABLE `tipo_edad` (
  `cod` int(4) NOT NULL,
  `tipo_edad` varchar(100) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.tipo_usuario definition
CREATE TABLE `tipo_usuario` (
  `cod` int(4) NOT NULL,
  `tipo_usuario` varchar(100) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- hospitalizacion.atencion definition
CREATE TABLE `atencion` (
  `consecutivo` int(4) NOT NULL,
  `anio` int(4) NOT NULL,
  `cod_eas` varchar(6) NOT NULL,
  `cod_tipo_usuario` int(4) NOT NULL,
  `cod_ips` varchar(12) NOT NULL,
  `cod_municipio` varchar(6) NOT NULL,
  `cod_departamento` varchar(3) NOT NULL,
  `cod_causa_externa` int(4) NOT NULL,
  `cod_dx_ppal_egreso` varchar(4) NOT NULL,
  `cod_tipo_edad` int(4) NOT NULL,
  `edad` int(4) NOT NULL,
  `sexo` varchar(2) NOT NULL,
  `zona` varchar(2) NOT NULL,
  `servicio` varchar(50) NOT NULL,
  `total_atenciones` int(4) NOT NULL,
  PRIMARY KEY (`consecutivo`),
  KEY `atencion_eas_FK` (`cod_eas`),
  KEY `atencion_tipo_usuario_FK` (`cod_tipo_usuario`),
  KEY `atencion_ips_FK` (`cod_ips`),
  KEY `atencion_municipios_FK` (`cod_municipio`),
  KEY `atencion_departamentos_FK` (`cod_departamento`),
  KEY `atencion_causa_externa_FK` (`cod_causa_externa`),
  KEY `atencion_diagnostico_FK` (`cod_dx_ppal_egreso`),
  KEY `atencion_tipo_edad_FK` (`cod_tipo_edad`),
  CONSTRAINT `atencion_eas_FK` FOREIGN KEY (`cod_eas`) REFERENCES `eas` (`cod`),
  CONSTRAINT `atencion_tipo_usuario_FK` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipo_usuario` (`cod`),
  CONSTRAINT `atencion_ips_FK` FOREIGN KEY (`cod_ips`) REFERENCES `ips` (`cod`),
  CONSTRAINT `atencion_municipios_FK` FOREIGN KEY (`cod_municipio`) REFERENCES `municipios` (`cod`),
  CONSTRAINT `atencion_departamentos_FK` FOREIGN KEY (`cod_departamento`) REFERENCES `departamentos` (`cod`),
  CONSTRAINT `atencion_causa_externa_FK` FOREIGN KEY (`cod_causa_externa`) REFERENCES `causa_externa` (`cod`),
  CONSTRAINT `atencion_diagnostico_FK` FOREIGN KEY (`cod_dx_ppal_egreso`) REFERENCES `diagnostico` (`cod`),
  CONSTRAINT `atencion_tipo_edad_FK` FOREIGN KEY (`cod_tipo_edad`) REFERENCES `tipo_edad` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
