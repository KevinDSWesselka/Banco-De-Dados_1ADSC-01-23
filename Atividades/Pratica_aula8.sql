-- Kevin D.S. Wesselka - Aula 08 - 31/03
-- Tipos de relacionamentos, entidades e atributos

-- Exercício funcionário X dependente (plano de saúde)

create database saude;
use saude;

create table funcionario (
id_funcionario int primary key auto_increment, -- Aributo indentificador
nome varchar(45), -- + nome = atributo composo
sobrenome varchar(45),
cep char(9), -- + complemento = atributo composto
complemento varchar(45)
);

insert into funcionario values 
	(null, 'Xororó', 'Lima', '01313905', 'num 9, apto 110'),
	(null, 'Chitãozinho', 'Lima', '01313905', 'num 9, apto 120'),
	(null, 'Sandy', 'Lima', '01313905', 'num 9, apto 130'),
	(null, 'Junior', 'Lima', '01313905', 'num 9, apto 140');
    
create table dependente (
id_dependente int auto_increment,
nome varchar(45),
parentesco varchar(45),
dt_nasc date,
fk_funcionario int,
constraint fk_funcionario foreign key (fk_funcionario) references funcionario(id_funcionario),
constraint pk_dependente primary key (id_dependente, fk_funcionario) -- chave primaária composta
) auto_increment = 100;

insert into dependente values
	(null, 'Lucas', 'Marido', '1984-01-01', 3),
	(null, 'Ttheo', 'Filho', '2006-01-01', 3),
	(null, 'Noeli', 'Esposa', '2006-01-01', 3);
    
update dependente set dt_nasc = '1954-01-01' where id_dependente = 102;

-- Selecionando todos da tabela funcionario que estão em dependente com a id_funcionario = f_funcionario
select * from funcionario join dependente 
	on id_funcionario = fk_funcionario;
    
-- Selecionando e mostrando por idade (anos) e selecionando com o nome
select nome, timestampdiff(year, dt_nasc, now()) as idade from dependente;

-- Selecionando e mostrando por idade (dias) e selecionando com o nome
select nome, timestampdiff(day, dt_nasc, now()) as idade from dependente;

-- Concatenando os dados do endereço e selecionando com o nome
select nome, concat(cep, ' ', complemento) as endereço from funcionario;

-- selecionando TODOS da tabela que estiver na ESQUERDA (funcionario)
select * from funcionario left join dependente 
	on id_funcionario = fk_funcionario;

-- selecionando TODOS da tabela que estiver na DIREITA (funcionario)
select * from dependente right join funcionario
	on id_funcionario = fk_funcionario;

-- selecionando TODOS da tabela que estiver na DIREITA (funcionario) que não tem dependetes
select * from dependente right join funcionario
	on id_funcionario = fk_funcionario where fk_funcionario is null;
    
-- **BONUS**
-- Como dar join em mais de uma tabela
-- join em mais de 2 tabelas 
-- select * from tb1 join tb2 on id_tb1 = fk_tb1
--  join  tb3 on id = fk;