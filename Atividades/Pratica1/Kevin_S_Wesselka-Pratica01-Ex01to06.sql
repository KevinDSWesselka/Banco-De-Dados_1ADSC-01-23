-- 1.Escreva e execute os comandos para:
-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
-- tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
-- (int, representando a quantidade de medalhas que o atleta possui)
create database db_esporte;
use db_esporte;

create table tb_atleta (
id_atleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qntMefalha int 
);
desc tb_atleta;

alter table tb_atleta rename column qntMefalha to qntMedalha;

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
insert into tb_atleta (nome, modalidade, qntMedalha) values 
	('Jamon Freias', 'Tiro ao alvo', '4'),
    ('Jasinto Bauru', 'Natacao', '1'),
    ('Kalvin Kleiton', 'Salto com vara', '0');
    
-- Exibir todos os dados da tabela.
select * from tb_atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
select nome,  qntMedalha from tb_atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from tb_atleta where modalidade = 'Natacao';

-- Exibir os dados da tabela ordenados pela modalidade.
select * from tb_atleta order by modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from tb_atleta order by qntMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from tb_atleta where nome like ('%s%');

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
select * from tb_atleta where nome like ('J%');

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
insert into tb_atleta (nome, modalidade, qntMedalha) value 
	('Rosvaldo Costa', 'Levantamento de peso', '7');
insert into tb_atleta (nome, modalidade, qntMedalha) value 
	('Osvaldo Brenito', 'Levantamento de peso', '7');
    
select * from tb_atleta where nome like ('%o');

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from tb_atleta where nome like ('%r_');

-- Eliminar a tabela.
drop table tb_atleta;

-- =========================================================================

-- 2.Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
-- (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.

create database db_musicas;
use db_musicas;

create table tb_musica (
id_musica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

-- Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
-- música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
-- menos umas 7 músicas.

insert into tb_musica (titulo, artista, genero) values
	('Thunderstruck - AC/DC','AC/DC','heavy metal/Rock'),
    ('Highway to Hell - AC/DC','AC/DC','Rock and Roll'),
    ('Joker and the Thief','WolfMother','Rock/Metal'),
    ('Heavy Weight','WolfMother','Rock/Indie'),
    ('This Fire','Franz Ferdinand','Rock/Indie'),
    ('Take me Out','Franz Ferdinand','Rock/Indie'),
    ('Two Moons','BoytWithUke','Alternative/Indie'),
    ('Toxic','BoytWithUke','Alternative/Indie');
    
    -- Exibir todos os dados da tabela
    select * from tb_musica;
    
    -- Exibir apenas os títulos e os artistas das músicas
    select titulo, artista from tb_musica;
    
    -- Exibir apenas os dados das músicas de um determinado gênero.
    select * from tb_musica where genero ='Rock/Indie';
    
    -- Exibir apenas os dados das músicas de um determinado artista.
select * from tb_musica where artista ='AC/DC';

-- Exibir os dados da tabela ordenados pelo título da música.
select * from tb_musica order by titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from tb_musica order by artista desc;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from tb_musica where titulo like ('T%');

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
select * from tb_musica where artista like ('%E');

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma
-- determinada letra.
select * from tb_musica where genero like ('_O%');

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma
-- determinada letra.
select * from tb_musica where titulo like ('%D_');

-- Elimine a tabela.
drop table tb_musica;

-- =========================================================================

-- 3.Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
-- (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.

create database db_filmes;
use db_filmes;-- 

create table tb_filme(
id_filme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);
desc tb_filme;

-- Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
-- filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
-- uns 7 filmes.
insert into tb_filme (titulo, genero, diretor) values 
	('Os Caçadores da Arca Perdida','Ação/Aventura','George Lucas'),
    ('Star Wars: Episódio III – A Vingança dos Sith','Ficção científica','George Lucas'),
    ('Star Wars: Episódio I – A Ameaça Fantasma','Ficção científica','George Lucas'),
    ('Vingadores: Ultimato','Ação/Fantasia','Anthony Russo'),
    ('Capitão América: O Primeiro Vingador','Ação','Joe Johnston'),
    ('Capitão América 2: O Soldado Invernal','Ação','Joe Russo'),
    ('O Espetacular Homem-Aranha','Ação/Aventura','Mark Webb'),
    ('Homem-Aranha (2002)','Ação','Sam Raimi');
    
-- Exibir todos os dados da tabela.
select * from tb_filme;

-- Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from tb_filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
select * from tb_filme where titulo = 'Star Wars: Episódio III – A Vingança dos Sith';

-- Exibir apenas os dados dos filmes de um determinado diretor.
select * from tb_filme where diretor = 'George Lucas';

-- Exibir os dados da tabela ordenados pelo título do filme.
select * from tb_filme order by titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from tb_filme order by diretor desc;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from tb_filme where titulo like ('S%');

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select * from tb_filme where diretor like ('J%');

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma
-- determinada letra.
select * from tb_filme where genero like ('_ç%');

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma
-- determinada letra.
select * from tb_filme where titulo like ('%t_');

-- Elimine a tabela.
drop table tb_filme;

-- =========================================================================

-- 4.Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
-- especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
-- tabela.

create database db_escola;
use db_escola;

create table tb_professor (
id_professor int primary key auto_increment,
nome varchar(50),
escialidade varchar(40),
dt_nasc date
);
desc tb_professor;

alter table tb_professor rename column escialidade to especialidade;

-- Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
-- Procure inserir pelo menos uns 6 professores.
insert into tb_professor (nome, especialidade, dt_nasc) value 
	('Vivian Create','Banco de Dados','1983-10-13'),
    ('Kevin BD','Algoritimos','2003-03-03'),
    ('Carlos Vetor','ArqComp','2000-07-05'),
    ('Enzo Var','TI','2003-06-07'),
    ('Guilherme Div','Socio Emocional','2002-04-10'),
    ('Bazilio Select','PI','2003-04-01');
    
    -- Exibir todos os dados da tabela
    select * from tb_professor;
    
    -- Exibir apenas as especialidades dos professores
    select especialidade from tb_professor;
    
    -- Exibir apenas os dados dos professores de uma determinada especialidade.
    select * from tb_professor where especialidade = 'Banco de Dados';
    
    -- Exibir os dados da tabela ordenados pelo nome do professor.
    select * from tb_professor order by nome;
    
    -- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from tb_professor where nome like ('V%');

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from tb_professor where nome like ('%r');

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma
-- determinada letra
select * from tb_professor where nome like ('_E%');

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from tb_professor where nome like ('%o_');

-- Elimine a tabela.
drop table tb_professor; 

-- =========================================================================

-- 5.Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
-- (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.

create database db_cursos;
use db_cursos;

create table tb_curso (
id_curos int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(50)
);
describe tb_curso;

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
insert into tb_curso (nome, sigla, coordenador) value 
	('Ingles','ING','Kevin'),
    ('Noodle','NOD','Carlos'),
    ('Java','JV','Enzo');

-- Exibir todos os dados da tabela
select * from tb_curso;

-- Exibir apenas os coordenadores dos cursos.
select coordenador from tb_curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from tb_curso where sigla = 'ING';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from tb_curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from tb_curso order by nome desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra
select * from tb_curso where nome like ('I%');

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from tb_curso where nome like ('%E');

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
-- determinada letra.
select * from tb_curso where nome like ('_a%');

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from tb_curso where nome like ('%v_');

-- Elimine a tabela.
drop table tb_curso;

-- =========================================================================

-- 6.Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
-- Epoca, Quatro Rodas, Claudia, etc).

create database db_banca;
use db_banca;

-- Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
-- primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
-- valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente pelo sistema.
create table tb_revistas (
id_revista int primary key auto_increment,
nome varchar(40),
categoria varchar(30)
);
desc tb_revistas;

-- Inserir 4 registros na tabela, mas sem informar a categoria
insert into tb_revistas (nome)value 
	('Jovem Geek'),
    ('Mundo Nerd'),
    ('Nerd ao Cubo'),
    ('Cosmos');
    
-- Exibir todos os dados da tabela.
select * from tb_revistas;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
-- novamente para verificar se atualizou corretamente.
update tb_revistas set categoria = 'Noticia Geek' where id_revista = '1';
update tb_revistas set categoria = 'Noticia Series e Filmes' where id_revista = '3';
update tb_revistas set categoria = 'Noticia Cientifica' where id_revista = '4';
select * from tb_revistas;

-- Insira mais 3 registros completos.
insert into tb_revistas (nome, categoria) value
 ('Veja','Noticias Gerais'),
 ('PlayStation','Noticias Games'),
 ('Amalnaque Games','Amalnaqye de jogos');
 
 -- Exibir novamente os dados da tabela.
 select * from tb_revistas;
 
 -- Exibir a descrição da estrutura da tabela.
 desc tb_revistas;
 
 -- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
 alter table tb_revistas modify column categoria varchar(40);
 
 -- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
-- tamanho da coluna categoria
desc tb_revistas;
   
-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table tb_revistas  add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from tb_revistas;

-- Excluir a coluna periodicidade da tabela.
alter table tb_revistas drop column periodicidade;