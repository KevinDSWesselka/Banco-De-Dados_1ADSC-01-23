create database SpTech_1ADSC;
use SpTech_1ADSC;

-- datetime '2023-03-03 13:50:01'
-- tinyint 0-255
-- default -Uma configuração padrão do campo
-- Todos são constraint

create table tb_professor(
id_professor int primary key auto_increment,
nome varchar(50),
especialidade varchar(40) default 'Sem especialidade',
genero char(1), constraint chk_genero check
	(genero in ('f', 'm', 'n')),
dt_atual datetime default current_timestamp,
stt_atual tinyint
);

insert into tb_professor (genero) values 
	('m');
select * from tb_professor;

insert into tb_professor (nome, stt_atual) values
	('Dell Vale', 0),
	('Tang', 1),
	('Sukita', 2);

update tb_professor set stt_atual = 1 where id_professor = 4;

alter table tb_professor add constraint chk_stt check (stt_atual in (0,1));
select * from tb_professor;

delete from tb_professor where id_professor = 4;

insert into tb_professor (nome, stt_atual) values
	('Ki Suki', 1);
select * from tb_professor;

alter table tb_professor auto_increment = 1000;

insert into tb_professor (nome, especialidade) values 
	('Coca', 'Cola');
select * from tb_professor;

-- o professor com o nome xpto tem a especialidade x
select concat('O profssor com o nome ', nome, ' tem a especialidade ', especialidade) from tb_professor;

-- apelidar (alias)
select concat('O profssor com o nome ', nome, ' tem a especialidade ', especialidade) as frase from tb_professor;

select nome as 'Nome do professor' from tb_professor;
select especialidade as especial, stt_atual as 'Status Atual' from tb_professor;
desc tb_professor;

-- BONS ESTUDOS!!!