GO

IF OBJECT_ID('Conference_Conferencia', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Conferencia;
IF OBJECT_ID('Conference_Participantes', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Participantes;
IF OBJECT_ID('Conference_Artigos', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Artigos;
IF OBJECT_ID('Conference_Autores', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Autores;
IF OBJECT_ID('Conference_Instituicao', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Instituicao;
IF OBJECT_ID('Conference_PNEstudantes', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_PNEstudantes;
IF OBJECT_ID('Conference_PEstudantes', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_PEstudantes;
IF OBJECT_ID('Conference_Comprovativo', 'U') IS NOT NULL
	DROP TABLE dbo.Conference_Comprovativo;



CREATE TABLE Conference_Comprovativo(
	loc_ele varchar(128) NOT NULL PRIMARY KEY,
)

CREATE TABLE Conference_PEstudantes(
	comp_loc_ele varchar(128) NOT NULL REFERENCES Conference_Comprovativo(loc_ele) PRIMARY KEY,
)

CREATE TABLE Conference_PNEstudantes(
	referencia int NOT NULL PRIMARY KEY,
)

CREATE TABLE Conference_Instituicao(
	nome varchar(128) NOT NULL,
	endereco varchar(128) NOT NULL PRIMARY KEY,
)

CREATE TABLE Conference_Autores(
	nome varchar(128) NOT NULL PRIMARY KEY,
	email varchar(64) NOT NULL,
	endereco_instituicao varchar(128) NOT NULL REFERENCES Conference_Instituicao(endereco),
)

CREATE TABLE Conference_Artigos(
	nome_autores varchar(128) NOT NULL REFERENCES Conference_Autores(nome),
	titulo varchar(64) NOT NULL,
	numero int NOT NULL PRIMARY KEY,
)

CREATE TABLE Conference_Participantes(
	nome varchar(128) NOT NULL,
	email varchar(64) NOT NULL,
	instituicao varchar(128) NOT NULL,
	morada varchar(128) NOT NULL,
	ref_n_estudantes int NOT NULL REFERENCES Conference_PNEstudantes(referencia),
	comp_loc_ele_estudantes varchar(128) NOT NULL REFERENCES Conference_PEstudantes(comp_loc_ele),
	PRIMARY KEY(nome,instituicao),
)

CREATE TABLE Conference_Conferencia(
	num_artigo_cientifico int NOT NULL REFERENCES Conference_Artigos(numero),
	nome_participante varchar(128) NOT NULL,
	instituicao_participante varchar(128) NOT NULL,
	FOREIGN KEY (nome_participante, instituicao_participante) REFERENCES Conference_Participantes(nome,instituicao),
	PRIMARY KEY(num_artigo_cientifico,nome_participante,instituicao_participante),
)








