create table cidade
(
  cid_codigo int primary key,
  est_sigla varchar(2),
  nome varchar(100),
  constraint fk_est_sigla foreign key(est_sigla) references estado(est_sigla)
);

create table estado
(
  est_sigla varchar(2) primary key,
  nome varchar(100)
);

create table pessoa
(
  pes_codigo int primary key,
  cid_codigo int,
  nome varchar(100),
  idade int,
  email varchar(120),
  constraint fk_cid_codigo foreign key (cid_codigo) references cidade(cid_codigo)
);

create table conta
(
  cnt_numero int primary key,
  pes_codigo int,
  descricao varchar(120),
  data date,
  valor float,
  tipo varchar(1),
  situacao varchar(1),
  constraint fk_pes_codigo foreign key (pes_codigo) references pessoa(pes_codigo)
);

select *
from estado;

select *
from cidade;

select *
from pessoa;

select *
from conta;