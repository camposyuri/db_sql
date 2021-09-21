CREATE TABLE Aluno
(
  matricula int PRIMARY KEY,
  nome varchar(30)
);

INSERT INTO Aluno
  (
  matricula
  ,nome
  )
VALUES
  (
    10,
    'Yuri Campos'
);

SELECT *
FROM Aluno;

CREATE TABLE empregado
(
  mat_emp int PRIMARY KEY NOT NULL,
  nome_emp varchar(30) NOT NULL,
  end_emp varchar(80),
  cid_emp varchar(20)
);

CREATE TABLE dependente
(
  nome_dep varchar(30),
  mat_emp int,
  data_nasc date,
  CONSTRAINT pk_dep PRIMARY KEY (mat_emp, nome_dep),
  CONSTRAINT fk_empr_dep FOREIGN KEY(mat_emp) REFERENCES empregado(mat_emp)
);

SELECT *
FROM dependente;

--DROP TABLE dependente;


ALTER TABLE empregado ADD uf_emp char(2) NULL;

SELECT *
FROM empregado e;

ALTER TABLE empregado DROP COLUMN uf_emp;

ALTER TABLE dependente DROP CONSTRAINT pk_dep;

ALTER TABLE empregado DROP CONSTRAINT pk_emp;

ALTER TABLE dependente ADD CONSTRAINT pk_dep PRIMARY KEY (mat_emp, nome_dep);


-- Inserindo novos registros

INSERT INTO empregado
  (
  mat_emp,
  nome_emp,
  end_emp,
  cid_emp
  )
VALUES
  (
    10,
    'Marcos Ramos',
    'Rua X',
    'Itabira'
);

INSERT INTO empregado
VALUES
  (
    11,
    'Marcos Ramos',
    NULL,
    'SP'
);


SELECT *
FROM empregado e;

INSERT INTO empregado
  (
  mat_emp,
  nome_emp,
  end_emp,
  cid_emp
  )
VALUES
  (
    12,
    'Mario Andrade',
    'Rua 4',
    'Belo Horizonte'
);

INSERT INTO dependente
  (
  nome_dep,
  data_nasc,
  mat_emp
  )
VALUES
  (
    'Carlos Ramos',
    '2003-01-10',
    10
);

INSERT INTO dependente
  (
  nome_dep,
  data_nasc,
  mat_emp
  )
VALUES
  (
    'Joao Filho',
    '2003-01-10',
    11
);

SELECT *
FROM dependente d;


DELETE FROM empregado
WHERE mat_emp = 12;

SELECT *
FROM empregado e;

UPDATE empregado 
SET end_emp = 'Rua Branca'
WHERE mat_emp = 10;


SELECT nome_emp, cid_emp
FROM empregado e
WHERE mat_emp = 11;

SELECT *
FROM dependente d;

ALTER TABLE empregado ADD salario float NULL;

SELECT *
FROM empregado;

UPDATE empregado 
SET salario = 2000
WHERE mat_emp = 10;


UPDATE empregado
SET salario = 1000
WHERE mat_emp = 11;


SELECT nome_emp AS nome, salario AS salario,
  12 * (salario + 300) AS salarioMaior
FROM empregado;

SELECT *
FROM empregado;


SELECT DISTINCT codcliente
FROM conta;

SELECT *
FROM empregado
WHERE bairro
ILIKE '%savassi%';

SELECT nomemp
FROM empregado
WHERE cidemp LIKE '_a%';

SELECT *
FROM empregado
WHERE (salario BETWEEN 30000 AND 40000) AND coddepto = 1;


SELECT nomemp
FROM empregado
WHERE cargo IN ('Vendedor', 'Presidente');

SELECT nomemp
FROM empregado
WHERE comissao IS NOT NULL AND coddepto = 1;


SELECT sum(salario) AS soma, max(salario),
  min(salario) AS maior, avg(salario) AS media
FROM empregado;


SELECT count(*)
FROM empregado;


SELECT nomemp
FROM empregado
ORDER BY nomemp desc;

SELECT coddepto, count(*) AS qtde, avg(salario) AS sal
FROM empregado
GROUP BY coddepto;


SELECT p.codprojeto, p.projnome, count(*)
FROM projeto p, trabalha_em t
WHERE p.codprojeto = t.codprojeto
GROUP BY p.codprojeto, p.projnome
HAVING count(*) > 2;


SELECT nomemp
FROM empregado
WHERE salario > ALL (SELECT salario
FROM empregado
WHERE coddepto = 2);


