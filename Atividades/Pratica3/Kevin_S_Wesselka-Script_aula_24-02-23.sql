
-- Script  aula 24/02/23
create database sptechc;
use sptechc;

-- campos do tipo numerico
-- numeros inteiros (int)
-- numeors decimais 
-- float: 7 digitos 1234567
-- double: 15 digitos 123456789012345
-- decimal (TOTAL, QTD Num pos virgula)
-- decimal(1,5): 123,45
-- decimal(7,4): 123,4567

create table tb_pessoa (
id_pessoa int primary key auto_increment,
nome varchar(50) not null,
peso float,
altura float,
salario decimal(5,2),
constraint chck_Slaraio check(salario >= 0)
-- CONSTRAINT (RESTIÇÂO OU CONFIGURAÇÂO DO CAMPO)
-- CHECK, NOT NULL, PEIMARY KEY, são todas CONSTRAINT
)auto_increment = 100; 
desc tb_pessoa;

alter table tb_pessoa
	add constraint chk_peso check (peso >=0),
	add constraint chk_altura check (altura >= 0);
    
-- este comando tem que dar erro!
-- Error Code: 3819. Check constraint 'chck_Slaraio' is violated.	0.000 sec
insert into tb_pessoa values
	(null, 'Marcelinho', 90.4, 210, -9.99);
    
-- inserindo dados validos
insert into tb_pessoa values
	(null, 'Durant', 90.4, 210, 399.99),
	(null, 'Hortencia', 78.6, 174, 99.99),
	(null, 'Oscar', 110.2, 205, 99.99);
select * from tb_pessoa;

-- exibir pessoas cujo o nome a terceira letra é "R"
select * from tb_pessoa where nome like '__R%';    

-- exibir pessoas cujo a altura é diferente de 210
select * from tb_pessoa where altura <> 210;
-- ou
select * from tb_pessoa where altura != 210;

-- exibir pessoas cujo a altura é igual a 210 e 205
select * from tb_pessoa where altura = 210 or altura = 205;
-- ou 
select * from tb_pessoa where altura IN (210,205);

-- atualizar salario
update tb_pessoa set salario = 199.99
	where id_pessoa IN (101,102);
select * from tb_pessoa;

-- delete 
delete from tb_pessoa where id_pessoa = 102;
select * from tb_pessoa;

-- id 103
insert into tb_pessoa value	
	(null, 'James', 115, 212, 999.99);
select * from tb_pessoa;

-- limpando a tabela
truncate table tb_pessoa;

-- apos limpar a tabela com truncate, as configurações de auto_increment são perdidas
-- e voltam a ser 1
insert into tb_pessoa value
	(null, 'Jordan', 99.7, 199, 976.90);
select * from tb_pessoa;