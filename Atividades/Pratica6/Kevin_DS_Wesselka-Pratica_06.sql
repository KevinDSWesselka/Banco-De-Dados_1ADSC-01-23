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
fk_representante int,
-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
constraint fkprojeto foreign key (fk_projeto) references tb_projeto(id_projeto),
constraint fkrepresentante foreign key (fk_representante) references tb_aluno (id_aluno),
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

INSERT INTO tb_aluno VALUES
(1, 'João', '11987654321', 1, NULL),
(2, 'Maria', '11912345678', 2, 1),
(3, 'Pedro', '11987654321', 1, 1),
(4, 'Julia', '11976543210', 2, 2),
(5, 'Lucas', '11999998888', 1, NULL);

INSERT INTO tb_acompanhante VALUES 
    (null, 'Fernanda', 'Irmã', 1),
    (null, 'Luciana', 'Mãe', 2),
    (null, 'Ricardo', 'Pai', 3),
    (null, 'Roberto', 'Avô', 4),
    (null, 'Marcela', 'Tia', 5);

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
	on Aluno.fk_representante = Representante.id_aluno;
    
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
-- de um determinado projeto (indicar o nome do projeto na consulta).
select tb_aluno.*, tb_projeto.nome as nome_projeto, tb_projeto.id_projeto, tb_projeto.descricao
	from tb_aluno join tb_projeto 
		on tb_aluno.fk_projeto = tb_projeto.id_projeto
			where tb_projeto.nome = 'Projeto de Música nas Escolas';
            
-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select * from tb_aluno join tb_projeto 
	on fk_projeto = id_projeto
		join tb_acompanhante 
			on fk_aluno = id_aluno;

-- ===========================================================================================

-- 2. Fazer a modelagem lógica de um sistema para cadastrar as campanhas de
-- doações que surgiram devido ao Covid-19 e os organizadores dessas campanhas

-- a) Criar um banco de dados chamado Campanha.
-- b) Selecionar esse banco de dados.
create database Campanha;
use Campanha;

-- c) Criar as tabelas correspondentes à sua modelagem
create table tb_organizador (
id_organizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da
-- criação das tabelas.
fk_org_experiente int,
constraint fkorgexperiente foreign key (fk_org_experiente) references tb_organizador (id_organizador)
)auto_increment = 30; select * from  tb_organizador;

create table tb_instituicao (
id_instituicao int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45)
); select * from tb_instituicao;

create table tb_campanha (
id_campanha int auto_increment,
categoria varchar(45),
data_final date,
fk_organizador int,
fk_instituicao1 int,
fk_instituicao2 int,
-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da
-- criação das tabelas.
constraint pkcampanha primary key (id_campanha, fk_organizador),
constraint fkorganizador foreign key (fk_organizador) references tb_organizador (id_organizador),
constraint fkinstituicao1 foreign key (fk_instituicao1) references tb_instituicao (id_instituicao),
constraint fkinstituicao2 foreign key (fk_instituicao2) references tb_instituicao (id_instituicao)
)auto_increment = 500; 

-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para
-- algum organizador, e mais de um organizador novato sendo orientado por algum
-- organizador mais experiente.

insert into tb_organizador values
    (null, 'Alice Lima', 'Rua das Flores, 123', 'Centro', 'alice.lima@email.com', null);
    
insert into tb_organizador values
    (null, 'João Silva', 'Rua dos Pássaros, 456', 'Jardim', 'joao.silva@email.com', 30),
    (null, 'Maria Santos', 'Rua das Árvores, 789', 'Vila', 'maria.santos@email.com', 31),
    (null, 'Pedro Souza', 'Rua das Pedras, 321', 'Leste', 'pedro.souza@email.com', 32),
    (null, 'Mariana Aguiar', 'Rua das FLores, 321', 'Oeste', 'mari.aguiar@email.com', 31);

insert into tb_instituicao values
    (null, 'Hospital São Lucas', 'Rua dos Médicos, 456', 'Centro'),
    (null, 'Escola Estadual Dom Pedro II', 'Rua dos Professores, 789', 'Vila'),
    (null, 'Asilo São Francisco', 'Rua dos Idosos, 123', 'Jardim');

insert into tb_campanha values
    (null, 'Campanha de Doação de Sangue', '2023-05-15', 30, 1, 2),
    (null, 'Campanha de Arrecadação de Alimentos', '2023-06-30', 31, 1, null),
    (null, 'Campanha de Voluntariado', '2023-07-31', 32, 1, 3),
    (null, 'Campanha de Doação de Brinquedos', '2023-12-20', 30, 2, 3),
    (null, 'Campanha de Arrecadação de Agasalhos', '2024-06-30', 32, null, 3),
    (null, 'Campanha de Limpeza da Praia', '2024-07-31', 31, 2, 3),
    (null, 'Campanha de Doação de Livros', '2024-12-20', 32, 1, 2),
    (null, 'Campanha de Arrecadação de Material Escolar', '2025-01-30', 30, 1, 3),
    (null, 'Campanha de Doação de Roupas', '2025-06-30', 31, 1, 2),
    (null, 'Campanha de Ação Social', '2025-12-31', 32, 1, 2);
    
-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from tb_organizador;
select * from tb_instituicao;
select * from tb_campanha;

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select * from tb_organizador left join tb_campanha 
	on id_organizador= fk_organizador;
    
-- h) Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
select tb_campanha.*, tb_organizador.nome as Nome_Organizador, categoria, data_final, fk_organizador, fk_instituicao1, fk_instituicao2
	from tb_organizador join tb_campanha 
		on tb_campanha.fk_organizador = tb_organizador.id_organizador
			where tb_organizador.nome = 'Alice Lima';

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores.
select * from tb_organizador as Organizador_Novato join tb_organizador as Organizador_Experiente 
	on Organizador_Novato.fk_org_experiente = Organizador_Experiente.id_organizador;
    
-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores, porém somente de um determinado organizador
-- orientador (informar o nome do organizador orientador na consulta).
select * from tb_organizador as Organizador_Experiente join tb_organizador as Organizador_Novato
	on Organizador_Novato.fk_org_experiente = Organizador_Experiente.id_organizador
		where Organizador_Experiente.nome = 'João Silva';
        
-- l) Exibir os dados dos organizadores novatos, os dados das respectivas
-- campanhas organizadas e os dados dos respectivos organizadores orientadores.
select * from tb_organizador as Organizador_Experiente join tb_organizador as Organizador_Novato
	on Organizador_Novato.fk_org_experiente = Organizador_Experiente.id_organizador
		join tb_campanha 
			on fk_organizador = Organizador_Experiente.id_organizador;
            
-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta),
-- os dados das respectivas campanhas em que trabalha e os dados do seu
-- organizador orientador.
select * from tb_organizador as Organizador_Experiente join tb_organizador as Organizador_Novato
	on Organizador_Novato.fk_org_experiente = Organizador_Experiente.id_organizador
		where Organizador_Novato.nome = 'Mariana Aguiar';