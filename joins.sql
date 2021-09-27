select *
from conta;

select *
from departamento;

select e.nomemp, e.endemp, d.deptonome
from empregado e
  inner join departamento d on e.coddepto = d.coddepto
where d.deptonome
ilike '%pesquisa%';

select *
from empregado e
  left join departamento d on e.coddepto = d.coddepto;

select *
from empregado e
  right join departamento d on e.coddepto = d.coddepto;

select *
from empregado e
  full join departamento d on e.coddepto = d.coddepto;

select *
from empregado e
cross join departamento d;

select e.nomemp, p.projnome
from empregado e
  inner join trabalha_em t on e.matemp = t.matemp
  inner join projeto p on t.codprojeto = p.codprojeto;