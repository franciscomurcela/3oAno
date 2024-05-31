CREATE TABLE medico (
  numSNS int primary key,
  nome varchar(50),
  especialidade varchar(50)
);

CREATE TABLE paciente (
  numUtente int primary key,
  nome varchar(50),
  dataNasc date,
  endereco varchar(100)
);

CREATE TABLE farmacia (
  nome varchar(50) primary key,
  telefone int,
  endereco varchar(100)
);

CREATE TABLE farmaceutica (
  numReg int primary key,
  nome varchar(50),
  endereco varchar(100)
);

CREATE TABLE farmaco (
  numRegFarm int references farmaceutica(numReg),
  nome varchar(50),
  formula varchar(50),
  primary key (numRegFarm, nome),
);

CREATE TABLE prescricao (
  numPresc int primary key,
  numUtente int references paciente(numUtente),
  numMedico int references medico(numSNS),
  farmacia varchar(50) references farmacia(nome),
  dataProc date,
);

CREATE TABLE presc_farmaco (
  numPresc int references prescricao(numPresc),,
  numRegFarm int,
  nomeFarmaco varchar(50),
  primary key (numPresc, numRegFarm, nomeFarmaco),
  foreign key (numRegFarm, nomeFarmaco) references farmaco(numRegFarm, nome)
);