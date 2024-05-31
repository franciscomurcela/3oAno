GO


IF OBJECT_ID('Stocks_Produto', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_Produto;
IF OBJECT_ID('Stocks_Encomenda', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_Encomenda;
IF OBJECT_ID('Stocks_Fornecedor', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_Fornecedor;
IF OBJECT_ID('Stocks_Items', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_Items;
IF OBJECT_ID('Stocks_TipoFornecedor', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_TipoFornecedor;
IF OBJECT_ID('Stocks_TipoPagamento', 'U') IS NOT NULL
	DROP TABLE dbo.Stocks_TipoPagamento;


CREATE TABLE Stocks_TipoPagamento(
	codigo int NOT NULL PRIMARY KEY,
	nome varchar(128) NOT NULL,
)

CREATE TABLE Stocks_TipoFornecedor(
	codigo int NOT NULL PRIMARY KEY,
	nome varchar(128) NOT NULL,
)

CREATE TABLE Stocks_Items(
	quantidade int NOT NULL,
	id int NOT NULL,
	PRIMARY KEY(quantidade, id)
)

CREATE TABLE Stocks_Fornecedor(
	tipo_pagamento_cod int NOT NULL REFERENCES Stocks_TipoPagamento(codigo),
	tipo_fornecedor_cod int NOT NULL REFERENCES Stocks_TipoFornecedor(codigo),
	nome varchar(128) NOT NULL,
	morada varchar(256) NOT NULL,
	nif int NOT NULL PRIMARY KEY,
)

CREATE TABLE Stocks_Encomenda(
	numero int NOT NULL PRIMARY KEY,
    [data] Datetime NOT NULL,
    quantidade int NOT NULL,
    items_id int NOT NULL,
    fornecedor_nif int NOT NULL,
    FOREIGN KEY (quantidade, items_id) REFERENCES Stocks_Items(quantidade, id),
    FOREIGN KEY (fornecedor_nif) REFERENCES Stocks_Fornecedor(nif)
)

CREATE TABLE Stocks_Produto(
    items_quantidade int NOT NULL,
    items_id int NOT NULL,
    codigo int NOT NULL PRIMARY KEY,
    preco int NOT NULL,
    nome varchar(128) NOT NULL,
    taxaiva int NOT NULL,
    FOREIGN KEY (items_quantidade, items_id) REFERENCES Stocks_Items(quantidade, id)
)

