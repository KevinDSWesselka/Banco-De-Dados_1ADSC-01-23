-- 1. No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
create database db_sprint1;
use db_sprint1;

create table tb_professor(
id_professor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40)
);

create table tb_diciplina (
id_diciplina int primary key auto_increment,
nome_diciplina varchar(45)
);

-- Configurar a chave estrangeira na tabela conforme sua modelagem (Pode fazer
-- no comando CREATE TABLE);
alter table tb_diciplina add column fk_professor int;
alter table tb_diciplina add constraint fkprofessor foreign key (fk_professor)
	references tb_professor (id_professor);
desc tb_diciplina;

insert into tb_professor values 
	(null, 'Vivian', 'Silva', 'Banco de Dados', 'Socio Emocional'),
	(null, 'Douglinhas', 'Queiroz', 'Banco de Dados', 'Algoritimos'),
	(null, 'João', 'Cordeiro', 'Banco de Dados', 'TI'),
	(null, 'Kevin', 'Wesselka', 'Algoritimos', 'Banco de Dados'),
	(null, 'Renanpago', 'Marquinos', 'TI', 'Socio Emocional'),
	(null, 'Frezerino', 'Froogs', 'Algoritimos', 'Arqui. Comp.'),
	(null, 'Majinrino', 'BubbleGum', 'Arqui. Comp', 'Banco de Dados');

select * from tb_professor;

insert into tb_diciplina values 
	(null,'ADS', 4),
	(null,'SIS', 1),
	(null,'ADS', 5),
	(null,'CCo', 2);
    
select * from tb_diciplina;

-- Exibir os professores e suas respectivas disciplinas;
select nome, nome_diciplina from tb_diciplina join tb_professor
	on fk_professor = id_professor;
    
-- Exibir apenas o nome da disciplina e o nome do respectivo professor;
select nome_diciplina, nome from tb_diciplina join tb_professor
	on fk_professor = id_professor;
    
-- Exibir os dados dos professores, suas respectivas disciplinas de um
-- determinado sobrenome;
select * from tb_professor join tb_diciplina 
	on id_professor = fk_professor where sobrenome = 'Wesselka';
    
-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado
-- professor, ordenado de forma crescente pela especialidade1;
select especialidade1, nome_diciplina, nome from tb_professor join tb_diciplina 
	on id_professor = fk_professor;
    
-- ======================================================================================

-- 2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
create database db_sprint2;
use db_sprint2;

create table tb_curso (
id_curso int primary key auto_increment,
nome_curso varchar(50),
sigla varchar(3),
coordenador varchar(45)
);

-- Regra de negocio:
-- 1 Cruso tem N Salas
-- N Salas tem apenas 1 curso por vez

create table tb_sala (
id_sala int primary key auto_increment,
andar int,
lado char(1), constraint chklado check (lado in ('A','B'))
);

alter table tb_sala add column fk_curso int,
	add constraint fkcurso foreign key (fk_curso)
		references tb_curso(id_curso);