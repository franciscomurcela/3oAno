CREATE TABLE tipo_fornecedor (
  codigo int primary key,
  designacao varchar(50) NOT NULL
);

CREATE TABLE fornecedor (
  nif int primary key,
  nome varchar(50) NOT NULL,
  fax varchar(20),
  endereco varchar(100),
  condpag int NOT NULL,
  tipo int NOT NULL references tipo_fornecedor(codigo),
);

CREATE TABLE produto (
  codigo int primary key,
  nome varchar(50) NOT NULL,
  preco float(5) NOT NULL,
  iva int NOT NULL,
  unidades int NOT NULL
);

CREATE TABLE encomenda (
  numero int primary key,
  [data] date,
  fornecedor int references fornecedor (nif),
);

CREATE TABLE item (
  numEnc int references encomenda (numero),
  codProd int references produto (codigo),
  unidades int,
  primary key (numEnc, codProd),
);