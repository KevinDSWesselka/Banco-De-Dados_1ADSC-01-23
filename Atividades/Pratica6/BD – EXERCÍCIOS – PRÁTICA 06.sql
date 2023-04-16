-- Kevin D.S. Wesselka
-- Criar um banco de dados AlunoProjeto no MySQL, selecionar esse
-- banco de dados e executar as instruções relacionadas a seguir.

create database AlunoProjeto;
use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem.
create table tb_projeto (
id_projeto int primary key auto_increment,
nome varchar(45),
descricao varchar(350)
);

create table tb_aluno (
id_aluno int,
nome varchar(45),
telefone char(12),
fk_projeto int,
-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
constraint fkprojeto foreign key (fk_projeto) references tb_projeto(id_projeto),
constraint pkaluno primary key (id_aluno, fk_projeto)
);

create table tb_acompanhante (
id_acompanahnte int auto_increment,
nome varchar(45),
relacao varchar(45),
fk_aluno int,
-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
constraint fkaluno foreign key (fk_aluno) references tb_aluno(id_aluno),
constraint pkacompanhante primary key (id_acompanahnte, fk_aluno)
);

-- Inserir dados nas tabelas.
insert into tb_projeto values
(null,'Projeto do Jardim Botânico', 'Um projeto para criar um jardim botânico em nossa cidade'),
(null,'Projeto de Música nas Escolas', 'Um projeto para trazer música para as escolas públicas da cidade'),
(null,'Projeto de Arte Urbana', 'Um projeto para criar murais e outras obras de arte nas paredes da cidade'),
(null,'Projeto de Limpeza dos Rios', 'Um projeto para limpar e preservar os rios que correm pela cidade'),
(null,'Projeto de Bibliotecas Comunitárias', 'Um projeto para criar bibliotecas comunitárias em áreas carentes da cidade');

insert into tb_aluno values
(1, 'João Silva', '1199999999', 1),
(2, 'Maria Santos', '1198888888', 1),
(3, 'Pedro Alves', '1197777777', 2),
(4, 'Ana Rodrigues', '1196666666', 3),
(5, 'Lucas Oliveira', '1195555555', 3);

insert tb_acompanhante values 
(null, 'Ana Silva', 'Mãe', 1),
(null, 'Pedro Santos', 'Pai', 1),
(null, 'Luciana Alves', 'Tia', 3),
(null, 'Jorge Rodrigues', 'Avô', 4),
(null, 'Fernanda Oliveira', 'Irmã', 5);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from tb_aluno;
select * from tb_acompanhante;
select * from tb_projeto;

-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from tb_projeto join tb_aluno
	on fk_projeto = id_projeto;
    
-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from tb_aluno join tb_acompanhante 
	on fk_aluno = id_aluno;
    
-- Exibir os dados dos alunos e dos seus representantes.
select * from tb_aluno as Aluno join tb_aluno as Representante
	on Aluno.fk_aluno 