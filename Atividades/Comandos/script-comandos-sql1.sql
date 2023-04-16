-- TODA TABELA TEM UMA CHAVE PRIMEIRA
-- TODO COMANDO É EM INGLÊS
-- TODO COMANDO TERMINA EM;
-- CRIAR O BANCO DE DADOS (schema ou database)
create database sptechc;
-- utilixar o banco de dados
use sptechc;
-- criar nossa primeira tabela
create table aluno (
-- nomeCampo tipagem restrição/costraint
ra char(8) primary key,
nome varchar (100),
bairro varchar (50)
);
-- descrever a estrutura da nossa tabela
describe aluno;
-- inserir dados na tabela
insert into aluno values 
('01231198', 'amanda', 'tucuruvi');
insert into aluno values
('01231042', 'theo', 'guilhermina'),
('01231022', 'felipe', 'vila andrade'),
('01231092', 'kat', 'itaim paulista'),
('01231079', 'joao', 'vila assis'),
('01231471', 'guedes', 'grajau');
-- exibir os dados da tabela
select *from aluno;

-- Excluir tabela 
drop table aluno;

-- Criar a tabela aluno
create table aluno (
-- Nome do campo, tipagem e restrição/constraint
ra char(8) primary key,
nome varchar(100),
bairro varchar(50)
);

describe aluno;
select *from aluno;

-- Adicionar um campo na tabela aluno
alter table aluno  add column email varchar(100);

-- Atualizar os email's dos anlunos
update aluno set email = 'felipe@sptech.school' 
	where ra = '01231022';
    
update aluno set email = 'theo@sptech.school' 
	where ra = '01231042';
    
update aluno set email = 'joao@sptech.school'
	where ra = '01231079'; 
    
update aluno set email = 'kat@sptech.school'
	where ra = '01231092';
    
update aluno set email = 'gudes@sptech.school'
	where ra = '01231471';
    
-- Adicionar a coluna/campo dtNasc
alter table aluno add column dtNasc DATE;
describe aluno;

-- Inserir um novo aluno, porém apenas os campos RA, EMAIL, DTNASC
-- data em formato americano 'AA-MM-DD'
insert into aluno (ra, email, dtNasc) value
	('01231999', 'vivian@sptech.school', '1983-10-13');
select * from aluno;

-- Modificar a tipagem de um campo
alter table aluno modify column nome VARCHAR(120);
desc aluno;

-- Reinomear um campo da tabela
alter table aluno rename column dtNasc to dataNasc;
describe aluno;

-- Excluir uma Tupla/Linha
delete from aluno where ra= '01231999';
select * from aluno;

-- Excluir a coluna da DATANASC
alter table aluno drop column dataNasc;
select *from aluno;

-- selects marotos
-- exibir aaluno cujo o nome é KAT
select * from aluno where nome = 'kat';

-- exibir apenas o bairro da kat
select bairro from aluno where nome  = 'kat';
select ra, email from aluno where nome  = 'guedes';

select * from aluno;

-- exibir os dados dos alunos oredenados pelo nome
select * from aluno Order by nome;
select * from aluno Order by nome desc;

-- exibir os dados dos alunos cujo o nome começa com a letra K
select * from aluno where nome like 'k%';

-- Exibir os dados dos alunos cujo o nome termina com letra O 
select * from aluno where nome like '%o';

-- exibir os dados dos alunos cujo o bairro cotem SS
select * from aluno where bairro like '%ss%';

-- exibir os dados dos alunos cujo o nome a terceira letra seja E 
select * from aluno where nome like '__E%';

-- Criar a tabela empresa
create table empresa (
id int primary key auto_increment,
nome varchar(100),
responsavel varchar(100)
);

insert into empresa (nome, responsavel) values
('C6 BANK', 'Andresa'),
('Box Delivery', 'Erika');
select * from empresa;

-- limpar a tablea 
truncate table empresa;