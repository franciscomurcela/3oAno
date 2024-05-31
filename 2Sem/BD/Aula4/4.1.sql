GO

IF OBJECT_ID('RentCar_Aluguer', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Aluguer;
IF OBJECT_ID('RentCar_Veiculo', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Veiculo;
IF OBJECT_ID('RentCar_Cliente', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Cliente;
IF OBJECT_ID('RentCar_Balcao', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Balcao;
IF OBJECT_ID('RentCar_Similaridade', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Similaridade;
IF OBJECT_ID('RentCar_Ligeiro', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Ligeiro;
IF OBJECT_ID('RentCar_Pesado', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_Pesado;
IF OBJECT_ID('RentCar_TipoVeiculo', 'U') IS NOT NULL
	DROP TABLE dbo.RentCar_TipoVeiculo;



CREATE TABLE RentCar_TipoVeiculo(
	Codigo int NOT NULL,
	ArCondicionado BIT NOT NULL,
	Designacao varchar(128) NOT NULL
	PRIMARY KEY (Codigo)
)

CREATE TABLE RentCar_Pesado(
	Peso int NOT NULL,
	Passageiros int NOT NULL,
	TipoVeiculo_Codigo int NOT NULL REFERENCES RentCar_TipoVeiculo(Codigo),
	PRIMARY KEY( TipoVeiculo_Codigo )
)

CREATE TABLE RentCar_Ligeiro(
	Combustivel varchar(64) NOT NULL, 
	Portas int NOT NULL, 
	NumLugares int NULL,
	TipoVeiculo_Codigo int NOT NULL PRIMARY KEY REFERENCES RentCar_TipoVeiculo(Codigo),
)

CREATE TABLE RentCar_Similaridade(
	TV_Codigo int NOT NULL REFERENCES RentCar_TipoVeiculo(Codigo),
	TV_Codigo2 int NOT NULL REFERENCES RentCar_TipoVeiculo(Codigo),
	PRIMARY KEY (TV_Codigo, TV_Codigo2)
)

CREATE TABLE RentCar_Balcao(
	Numero int NOT NULL,
	Nome varchar(256) NOT NULL,
	Endereco varchar(256) NOT NULL
	PRIMARY KEY (Numero)
)

CREATE TABLE RentCar_Cliente(
	Nif int NOT NULL,
	Nome varchar(256) NOT NULL,
	Endereco varchar(256) NOT NULL,
	Num_carta int NOT NULL
	PRIMARY KEY (Nif)
)

CREATE TABLE RentCar_Veiculo(
	Matricula varchar(128) NOT NULL,
	Ano int NOT NULL,
	Marca varchar(128) NOT NULL,
	TipoVeiculo_Codigo int NOT NULL REFERENCES RentCar_TipoVeiculo(Codigo)
	PRIMARY KEY (Matricula)
)

CREATE TABLE RentCar_Aluguer(
	Numero int NOT NULL,
	Duracao int NOT NULL,
	[Data] Datetime NOT NULL,
	Cliente_Nif int NOT NULL REFERENCES RentCar_Cliente(Nif),
	Balcao_Num int NOT NULL REFERENCES RentCar_Balcao(Numero),
	Veiculo_matricula varchar(128) NOT NULL REFERENCES RentCar_Veiculo(Matricula)
	PRIMARY KEY (Numero)
)
