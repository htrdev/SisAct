-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.32 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.1.0.4655
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para sistemaactividades
CREATE DATABASE IF NOT EXISTS `sistemaactividades` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sistemaactividades`;


-- Volcando estructura para tabla sistemaactividades.actividad
CREATE TABLE IF NOT EXISTS `actividad` (
  `idActividad` int(11) NOT NULL AUTO_INCREMENT,
  `fechaActividad` date DEFAULT NULL,
  `horaActividad` varchar(45) DEFAULT NULL,
  `estadoActividad` tinyint(1) DEFAULT NULL,
  `descripcionActividad` text,
  `tipoActividad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistemaactividades.actividad: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` (`idActividad`, `fechaActividad`, `horaActividad`, `estadoActividad`, `descripcionActividad`, `tipoActividad`) VALUES
	(1, '2014-03-07', '10:30', 1, 'Comunicado', 'Comunicado'),
	(2, '2014-03-21', '00:24', 0, 'adasfsdfsd', 'Comunicado'),
	(3, '2014-03-13', '02:04', 0, 'Comunicadooo', 'Comunicado'),
	(4, '2014-03-14', '02:06', 0, 'XDDDD', 'Comunicado'),
	(5, '2014-03-14', '02:01', 0, 'asdfdsfsdfwer', 'Comunicado'),
	(6, '2014-03-20', '00:00', 0, 'Contenido comunicado\r\n', 'Comunicado');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;


-- Volcando estructura para tabla sistemaactividades.invitaciondocente
CREATE TABLE IF NOT EXISTS `invitaciondocente` (
  `idInvitacionDocente` int(11) NOT NULL AUTO_INCREMENT,
  `Actividad_idActividad` int(11) NOT NULL,
  `Docente_idDocente` int(11) NOT NULL,
  PRIMARY KEY (`idInvitacionDocente`),
  KEY `fk_InvitacionDocente_Actividad1` (`Actividad_idActividad`),
  KEY `fk_InvitacionDocente_Docente1` (`Docente_idDocente`),
  CONSTRAINT `fk_InvitacionDocente_Actividad1` FOREIGN KEY (`Actividad_idActividad`) REFERENCES `actividad` (`idActividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InvitacionDocente_Docente1` FOREIGN KEY (`Docente_idDocente`) REFERENCES `docente` (`idDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistemaactividades.invitaciondocente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `invitaciondocente` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitaciondocente` ENABLE KEYS */;


-- Volcando estructura para tabla sistemaactividades.repositorioacademico
CREATE TABLE IF NOT EXISTS `repositorioacademico` (
  `InvitacionDocente_idInvitacionDocente` int(11) NOT NULL,
  `urlArchivo` varchar(45) DEFAULT NULL,
  `tipoArchivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`InvitacionDocente_idInvitacionDocente`),
  CONSTRAINT `fk_RepositorioAcademico_InvitacionDocente1` FOREIGN KEY (`InvitacionDocente_idInvitacionDocente`) REFERENCES `invitaciondocente` (`idInvitacionDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistemaactividades.repositorioacademico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `repositorioacademico` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositorioacademico` ENABLE KEYS */;


-- Volcando estructura para procedimiento sistemaactividades.USP_I_AgregarActividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarActividad`(
	pfechaActividad DATE ,
	phoraActividad VARCHAR(45) ,
	pestadoActividad TINYINT(1) ,
	pdescripcionActividad TEXT ,
	ptipoAtividad VARCHAR(45) 
)
BEGIN
INSERT INTO Actividad(
	fechaActividad,
	horaActividad,
	estadoActividad,
	descripcionActividad,
	tipoAtividad
)
VALUES(
	pfechaActividad,
	phoraActividad,
	pestadoActividad,
	pdescripcionActividad,
	ptipoAtividad
);
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_I_AgregarInvitacionDocente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarInvitacionDocente`(
	pActividad_idActividad INT,
	pDocente_idDocente INT
)
BEGIN
INSERT INTO InvitacionDocente(
	Actividad_idActividad,
	Docente_idDocente
)
VALUES(
	pActividad_idActividad,
	pDocente_idDocente
);
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_I_AgregarUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarUsuario`(
	ptipoUsuario VARCHAR(45),
	ppasswordUsuario VARCHAR(45),
	pDocente_idDocente INT
)
BEGIN
INSERT INTO Usuario(
	tipoUsuario,
	passwordUsuario,
	Docente_idDocente
)
VALUES(
	ptipoUsuario,
	ppasswordUsuario,
	pDocente_idDocente
);
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_S_ListarActividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarActividad`()
BEGIN
SELECT * FROM Actividad;
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_S_ListarUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarUsuario`()
BEGIN
SELECT * FROM Usuario;
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_U_ModificarActividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_U_ModificarActividad`(
	pidActividad INT , 
	pfechaActividad DATE ,
	phoraActividad VARCHAR(45) ,
	pestadoActividad TINYINT(1) ,
	pdescripcionActividad TEXT ,
	ptipoAtividad VARCHAR(45) 
)
BEGIN
UPDATE Actividad
SET
	fechaActividad = pfechaActividad,
	horaActividad = phoraActividad,
	estadoActividad = pestadoActividad,
	descripcionActividad = pdescripcionActividad,
	tipoAtividad = ptipoAtividad
WHERE idActividad = pidActividad;
END//
DELIMITER ;


-- Volcando estructura para procedimiento sistemaactividades.USP_U_ModificarUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_U_ModificarUsuario`(
	tipoUsuario VARCHAR(45),
	passwordUsuario VARCHAR(45),
	Docente_idDocente INT
)
BEGIN
UPDATE Actividad
SET
	tipoUsuario = ptipoUsuario,
	passwordUsuario = ppasswordUsuario,
	Docente_idDocente = pDocente_idDocente
WHERE Docente_idDocente = pDocente_idDocente;
END//
DELIMITER ;


-- Volcando estructura para tabla sistemaactividades.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `tipoUsuario` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT '0',
  `password` varchar(50) DEFAULT '0',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistemaactividades.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`tipoUsuario`, `idUsuario`, `usuario`, `password`) VALUES
	('Admin', 1, 'charlie', 'ochoa');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
