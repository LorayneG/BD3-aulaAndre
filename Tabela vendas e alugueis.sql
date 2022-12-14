-- BDIIIA11 - exercícios

drop database bd3;
create database bd3;

use bd3;

-- create table
create table clientes (
  id int(11) not null primary key auto_increment,
  cpf varchar(20) not null,
  nome varchar(200) not null,
  cidade varchar(200) not null,
  email varchar(200) not null
);

CREATE TABLE solicitacoes (
  id int(11) not null primary key auto_increment,
  nome varchar(80) not null,
  data timestamp not null,
  cliente_id int(11) not null,
  constraint foreign key (cliente_id) references clientes(id)
);

-- insert clientes
insert into clientes (cpf, nome, cidade, email) values ('123456789', 'André', 'Rio de Janeiro', 'andr@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('234567891', 'Bruno', 'Rio de Janeiro', 'bruno@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('345678912', 'David', 'Arraial do Cabo', 'david@andr.com.br');

-- insert solicitacoes
insert into solicitacoes (nome, data, cliente_id) values ('Mouse com defeito', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Erro na senha', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Teclado com tecla ruim', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Senha fora da validade', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Monitor com defeito', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Sumiu meu mouse', NOW(), 3);


-- 1) Crie um relatório que possua a quantidade de solicitações por usuários
-- O relatório deve conter os seguintes campos: nome do cliente, quantidade de solicitacoes



-- 2) Crie o relatório acima ordenando em ordem decrescente de solicitações
select clientes_id, count(id)
from solicitacoes
group by clientes_id
having count(id) >= 2
order by count(id) desc; 



-- 3) Quantos clientes o sistema tem por cidade
select cidade, count(id)
from clientes
group by cidade;


-- 4) Relatório de solicitações por cidade



-- 5) Relatório com todos os clientes que fizeram mais de uma solicitação
 select clientes, count(id)
 from solicitacoes
 group by cliente_id
 having count(id) >= 2;



