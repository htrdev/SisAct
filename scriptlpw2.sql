CREATE DATABASE Departamentos
GO

USE Departamentos
GO

CREATE TABLE ESTADO
(
	COD_EST INT,
	DESC_EST VARCHAR(100),
	CONSTRAINT PK_ESTADO PRIMARY KEY(COD_EST)
)
GO

CREATE TABLE USUARIO
(
	COD_USUA INT,
	NOM_USUA VARCHAR(100),
	APEPATER_USUA VARCHAR(50),
	APEMATER_USUA VARCHAR(50),
	FEC_NAC_USUA DATE,
	FEC_REG_USUA DATE NOT NULL CONSTRAINT DEFAULT_FEC_REG_USUA DEFAULT GETDATE(),
	TIPO_DOC_USUA VARCHAR(50),
	NUM_DOC_USUA VARCHAR(15),
	COD_EST INT,
	CONSTRAINT PK_USUARIO PRIMARY KEY(COD_USUA),
	CONSTRAINT FK_USUARIO_ESTADO FOREIGN KEY(COD_EST) REFERENCES ESTADO(COD_EST)
)
GO

CREATE TABLE INQUILINO
(
	COD_USUA INT,
	NOM_AVAL_INQ VARCHAR(100),
	APELL_AVAL VARCHAR(100),
	HABER_BAS_INQ VARCHAR(100),
	EST_CIVIL_INQ VARCHAR(20),
	LUG_TRAB_INQ VARCHAR(100),
	CONSTRAINT PK_INQUILINO PRIMARY KEY(COD_USUA),
	CONSTRAINT FK_INQUILINO_USUARIO FOREIGN KEY(COD_USUA) REFERENCES USUARIO(COD_USUA)
)
GO

CREATE TABLE FAMILIARES
(
	COD_FAMI INT,
	COD_USUA INT,
	NOM_FAMI VARCHAR(100),
	APEPATER_FAMI  VARCHAR(50),
	APEMATER_FAMI VARCHAR(50),
	GRADO_PARENTES_FAMI VARCHAR(50),
	CONSTRAINT PK_FAMILIARES PRIMARY KEY (COD_FAMI,COD_USUA),
	CONSTRAINT FK_FAMILIARES_INQUILINO FOREIGN KEY(COD_USUA) REFERENCES INQUILINO(COD_USUA)
)
GO

CREATE TABLE PROPIETARIO
(
	COD_USUA INT,
	TIPO VARCHAR(100),
	CONSTRAINT PK_PROPIETARIO PRIMARY KEY(COD_USUA),
	CONSTRAINT FK_PROPIETARIO_USUARIO FOREIGN KEY(COD_USUA) REFERENCES USUARIO(COD_USUA)
)
GO

CREATE TABLE CONTRATO
(
	COD_CONT INT,
	PROP_COD_USUA INT,
	INQ_COD_USUA INT,
	FEC_FIRMA DATE NOT NULL CONSTRAINT DEFAULT_FEC_FIRMA DEFAULT GETDATE(),
	REFERENCIA VARCHAR(100),
	COD_EST INT,
	COD_CONT_ORIG INT,
	CONSTRAINT PK_CONTRATO PRIMARY KEY(COD_CONT),
	CONSTRAINT FK_CONTRATO_CONTRATO FOREIGN KEY(COD_CONT_ORIG) REFERENCES CONTRATO(COD_CONT),
	CONSTRAINT FK_CONTRATO_INQUILINO FOREIGN KEY(INQ_COD_USUA) REFERENCES INQUILINO(COD_USUA),
	CONSTRAINT FK_CONTRATO_PROPIETARIO FOREIGN KEY(PROP_COD_USUA) REFERENCES PROPIETARIO(COD_USUA),
	CONSTRAINT FK_CONTRATO_ESTADO FOREIGN KEY(COD_EST) REFERENCES ESTADO(COD_EST),
)
GO

CREATE TABLE EDIFICIOS
(
	COD_EDIF INT,
	NOM_EDIF VARCHAR(100),
	DIRECC_EDIF VARCHAR(100),
	CODPOSTAL_EDIF VARCHAR(10),
	AREA_TOTAL_EDIF VARCHAR(20),
	REFERENCIA_EDIF VARCHAR(100),
	COD_EST INT,
	CONSTRAINT PK_EDIFICIOS PRIMARY KEY(COD_EDIF),
	CONSTRAINT FK_EDIFICIOS_ESTADO FOREIGN KEY(COD_EST) REFERENCES ESTADO(COD_EST)
)
GO

CREATE TABLE DEPARTAMENTOS
(
	COD_EDIF INT,
	COD_DEP INT,
	AREA_TOTAL_DEP VARCHAR(100),
	AREA_CONSTRUIDA_DEP VARCHAR(100),
	NUM_AMB_DEP VARCHAR(20),
	PISO_DEP VARCHAR(10),
	PRECIO_ALQXMES_DEP DECIMAL(8,2),
	COD_EST INT,
	CONSTRAINT PK_DEPARTAMENTOS PRIMARY KEY(COD_DEP,COD_EDIF),
	CONSTRAINT FK_DEPARTAMENTOS_EDIFICIOS FOREIGN KEY(COD_EDIF) REFERENCES EDIFICIOS(COD_EDIF),
	CONSTRAINT FK_DEPARTAMENTOS_ESTADO FOREIGN KEY(COD_EST) REFERENCES ESTADO(COD_EST)
)
GO

CREATE TABLE DETALLECONTRATO
(
	COD_EDIF INT,
	COD_DEP INT,
	COD_CONT INT,
	FEC_INI_ALQ DATE,
	FEC_FIN_ALQ DATE,
	CONSTRAINT PK_DETALLECONTRATO PRIMARY KEY(COD_EDIF,COD_DEP,COD_CONT),
	CONSTRAINT FK_DETALLECONTRATO_DEPARTAMENTOS FOREIGN KEY(COD_DEP,COD_EDIF) REFERENCES DEPARTAMENTOS(COD_DEP,COD_EDIF),
	CONSTRAINT FK_DETALLECONTRATO_CONTRATO FOREIGN KEY(COD_CONT) REFERENCES CONTRATO(COD_CONT)
)
GO
