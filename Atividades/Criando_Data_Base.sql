/*
Kevin S. Wesselka 10/02/2023
TODA TABELA TEM UMA CHAVE PRIMÁRIA
TODO COMANDO É EM INGLÊS
TODO COMANDO TERMINA COM ";"
*/ 
-- CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE)
CREATE DATABASE sptechc;

-- UTILIZAR O BANCO DE DADOS
USE sptechc;

CREATE TABLE aluno(
-- NOMECAMPO \ TIPAGEM \ RESTRIÇÃO/CONSTRAINT
RA char(8) primary KEY,
Nome varchar(100),
Bairo varchar(50) 
);

-- DESCREVER A ESTRUTURA DA NOSSA TABELA
describe aluno;

-- INSERINDO DADOS NA TABELA
insert into aluno values
	('01231198', 'AMANDA', 'TUCURUVI');
    
insert into aluno values
		('0987654', 'Joao', 'Maua'),
        ('1234567', 'Kat', 'Itaim'),
        ('9382950', 'Kevin', 'Maua');

-- UTILIZANDO OS DADOSDA TABELA
select * from aluno;
