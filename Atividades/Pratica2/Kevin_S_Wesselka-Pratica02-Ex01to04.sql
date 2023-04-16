create database db_sprint1;
use db_sprint1;

-- 1. Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
-- tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
-- (int, representando a quantidade de medalhas que o atleta possui)
create table tb_atleta(
id_atleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qntd_medalha int
);
desc tb_atleta;

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
-- e pelo menos 5 atletas.
insert into tb_atleta value
	(null, 'Master Yiago', 'Esgrima', 6),
    (null, 'Eevee Fiora', 'Esgrima', 4),
    (null, 'Var Seet', 'Box', 5),
    (null, 'Daniel Laruso', 'Karate', 2),
    (null, 'Centure Acc', 'Judo', 9);
    
-- Exibir todos os dados da tabela
select * from tb_atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1
update tb_atleta set qntd_medalha = 9 where
	id_atleta = 1;
    
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update tb_atleta set qntd_medalha = 6
	where id_atleta in (3,2);
    
-- Atualizar o nome do atleta com o id=4;
update tb_atleta set nome = 'Mestre Miyag'
	where id_atleta = 4;
    
-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date
alter table tb_atleta add column dt_nasc date;

-- Atualizar a data de nascimento de todos os atletas
update tb_atleta set dt_nasc = '1995-05-10' where id_atleta = 1;
update tb_atleta set dt_nasc = '1999-04-08' where id_atleta = 2;
update tb_atleta set dt_nasc = '2002-02-23' where id_atleta = 3;
update tb_atleta set dt_nasc = '1983-03-03' where id_atleta = 4;
update tb_atleta set dt_nasc = '1987-07-04' where id_atleta = 5;

-- Excluir o atleta com o id=5;
delete from tb_atleta where id_atleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação
insert into tb_atleta values 
	(null, 'Marcelo Felps', 'natação', 5, '1987-05-04');
select * from tb_atleta where modalidade <> 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from tb_atleta where qntd_medalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table tb_atleta modify column modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc tb_atleta;

-- Limpar os dados da tabela; 
truncate tb_atleta;

-- =========================================================================

-- 1.Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
-- (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
create table tb_musica (
id_musica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);
desc tb_musica;

-- Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
-- música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
-- menos umas 7 músicas.
insert into tb_musica values
	(null, 'Walk Away', 'Franz Ferdinand', 'Rock/Indie'),
	(null, 'This Fire', 'Franz Ferdinand', 'Indie/Rock'),
	(null, 'Back in Black', 'AC/DC', 'Metal/Rock'),
	(null, 'Thunderistruck', 'AC/DC', 'Rock/Metal'),
	(null, 'Toxic', 'BoyWithUke', 'Alternative/Indie'),
	(null, 'Two Moons', 'BoyWithUke', 'Indie/Alternative'),
	(null, 'Cabelos Arcoires', 'Kamaitach', 'Indie/Alternative');
    
-- Exibir todos os dados da tabela
select * from tb_musica;

-- Adicionar o campo curtidas do tipo int na tabela;
alter table tb_musica add column curtidas int;

-- Atualizar o campo curtidas de todas as músicas inseridas;
update tb_musica set curtidas = 250 where id_musica = 1;
update tb_musica set curtidas = 550 where id_musica = 2;
update tb_musica set curtidas = 5000 where id_musica = 3;
update tb_musica set curtidas = 4500 where id_musica = 4;
update tb_musica set curtidas = 780 where id_musica = 5;
update tb_musica set curtidas = 730 where id_musica = 6;
update tb_musica set curtidas = 180 where id_musica = 7;

-- Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table tb_musica modify column artista varchar(80);

-- Atualizar a quantidade de curtidas da música com id=1;
update tb_musica set curtidas = 350 where id_musica = 1;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update tb_musica set curtidas = 6000 where id_musica in (2,3);

-- Atualizar o nome da música com o id=5;
update tb_musica set titulo = 'Understand' where id_musica = 5;

-- Excluir a música com o id=4;
delete from tb_musica where id_musica = 4;

-- Exibir as músicas onde o gênero é diferente de funk;
insert into tb_musica value
	(null, 'Funk aleatorio', 'Funkeiro Aleatorio', 'Funk', 60);
select * from tb_musica where genero <> 'Funk';

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
insert into tb_musica value
	(null, 'Funk aleatorio2.0', 'Funkeiro Aleatorio2.0', 'Funk', 10);
select * from tb_musica where curtidas > 20;

-- Descrever os campos da tabela mostrando a atualização do campo artista;
desc tb_musica;

-- Limpar os dados da tabela;
truncate tb_musica;

-- =========================================================================

-- 3.Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
-- (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
create table tb_filme (
id_filme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);
desc tb_filme;

-- Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
-- filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
-- uns 7 filmes.
insert into tb_filme values
	(null,'Star Wars: Episódio IV - Uma Nova Esperança','Ficção cientifica','Geroge Lucas'),
	(null,'Star Wars: Episódio VI - O Retorno de Jedi','Ficção cientifica','Geroge Lucas'),
	(null,'The Batman','Ação/Aventura','Matt Reeves'),
	(null,'Aquaman','Aventura/Ação','James Wan'),
	(null,'Mulher-Maravilha 1984','Aventura/Ficção Cientifica','Patty Jenkins'),
	(null,'The Flash','Ação/Ficção Cientifica','Andy Muschietti'),
	(null,'O Homem de Aço','Ação/Ficção Cientifica','Zack Snyder');
    
-- Exibir todos os dados da tabela.
select * from tb_filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table tb_filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update tb_filme set protagonista = 'Luke SkyWalker' where id_filme = 1;
update tb_filme set protagonista = 'Luke SkyWalker' where id_filme = 2;
update tb_filme set protagonista = 'Bruce Wayne/Batman' where id_filme = 3;
update tb_filme set protagonista = 'Arthur Joseph/Aquaman' where id_filme = 4;
update tb_filme set protagonista = 'Diana/Mulher Maravilha' where id_filme = 5;
update tb_filme set protagonista = 'Barry Alan/Flash' where id_filme = 6;
update tb_filme set protagonista = 'Clark kent/Super Man ' where id_filme = 7;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table tb_filme modify column diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
update tb_filme set diretor = 'Zack Isnaider' where id_filme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update tb_filme set diretor = 'Andy Lucas' where id_filme in (2,5);

-- Atualizar o título do filme com o id=6;
update tb_filme set titulo = 'The Flash: FlashPoint' where id_filme = 6;

-- Excluir o filme com o id=3;
delete from tb_filme where id_filme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
insert into tb_filme values
	(null, 'Drama Aleatorio', 'Drama', 'Diretor Dramatico', 'Protagonista Dramatico');
select * from tb_filme where genero <> 'Drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
insert into tb_filme values 
	(null,'Suspense aleatorio', 'Supense', 'Diretor de Supense', 'Protagonista de Suspense');
select * from tb_filme where genero <> 'Suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
desc tb_filme;

-- Limpar os dados da tabela;
truncate tb_filme;

-- =========================================================================

-- Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
-- especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
-- tabela.
create table tb_professor(
id_professor int primary key auto_increment,
nome varchar(50),
especialidade varchar(40),
dt_nasc date
);
desc tb_professor;

-- Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
-- Procure inserir pelo menos uns 6 professores.
insert into tb_professor values 
	(null, 'Jose Lamon', 'Espanhou', '2003-01-01'),
    (null, 'João Bitor', 'Financias', '2003-01-01'),
    (null, 'Kevin Fesselka', 'Ingles', '2003-03-03'),
    (null, 'Kat Bantos', 'Geografia', '2002-07-02'),
    (null, 'Matias Eima', 'Algoritimos', '2000-07-22'),
    (null, 'Eduardo Pimas', 'Arqui.Comp.', '1987-09-12');
    
-- Exibir todos os dados da tabela.
select * from tb_professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
-- ‘assistente’ ou ‘titular’;
alter table tb_professor add column função varchar(50);
alter table tb_professor
	add constraint funcao_A check (função = 'assistente' or função = 'monitor' or função = 'titular');
    
-- Atualizar os professores inseridos e suas respectivas funções;
update tb_professor set função = 'assistente' where id_professor = 1;
update tb_professor set função = 'assistente' where id_professor = 2;
update tb_professor set função = 'assistente' where id_professor = 3;
update tb_professor set função = 'monitor' where id_professor = 4;
update tb_professor set função = 'titular' where id_professor = 5;
update tb_professor set função = 'titular' where id_professor = 6;

-- Exibir apenas os nomes dos professores titulares;
select nome from tb_professor where função = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select dt_nasc, especialidade from tb_professor where função = 'monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3;
update tb_professor set dt_nasc = '2002-02-02' where id_professor = 3;

-- Limpar a tabela Professor;
truncate tb_professor;
    
-- =========================================================================

-- 5.Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
-- (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
create table tb_curso(
id_curso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),	
coordenador varchar(50)
);
desc tb_curso;

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos
insert into tb_curso values 
	(null, 'Analise em Desenvolvimenot de Sistemas', 'ADS', 'Gerson'),
	(null, 'Ciencias da Computação', 'CCO', 'Alex'),
	(null, 'Sistemas da Informação', 'SIS', 'Alex');
    
-- Exibir todos os dados da tabela.
select * from tb_curso;

--  Exibir apenas os coordenadores dos cursos
select coordenador from tb_curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from tb_curso where sigla = 'ADS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from tb_curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from tb_curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from tb_curso order by