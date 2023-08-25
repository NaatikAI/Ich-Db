create database LOGIN;

use LOGIN;

show databases;

CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoPa` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoMa` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `correoElect` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idPersona` int NOT NULL,
  `idRol` int NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `usuario_FK` (`idRol`),
  KEY `usuario_FK_1` (`idPersona`),
  CONSTRAINT `usuario_FK` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `usuario_FK_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `sesion` (
  `idSesion` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `startTime` datetime NOT NULL,
  `finishTime` datetime NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idSesion`),
  KEY `sesion_FK` (`idUsuario`),
  CONSTRAINT `sesion_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON login.* TO 'admin'@'localhost';

CREATE USER 'medium'@'localhost' IDENTIFIED BY '123';
GRANT SELECT,INSERT,UPDATE,CREATE ON login.* TO 'medium'@'localhost';