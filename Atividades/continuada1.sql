-- Kevin DS Wesselka - SPTECH SCHOOL - 09/03/2023

-- Prova Continuada 1 - Banco de Dados



CREATE DATABASE continuada1;
drop database continuada1;
USE continuada1;



CREATE TABLE historico (

id INT PRIMARY KEY AUTO_INCREMENT,

nome VARCHAR(200) NOT NULL,

dataHora DATETIME DEFAULT current_timestamp,

url VARCHAR(250) NOT NULL,

navegador VARCHAR(100)

);



INSERT INTO historico (nome, url, navegador) VALUES

	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),

	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),

	('Ofertas e Promoções | Amazon.com.br', 'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),

	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),

	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),

	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),

	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),

	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),

	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),

	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');

    

-- De acordo com o SCRIPT realize o seguinte comando:

-- INSERIR OS DADOS NA TABELA historico CONFORME ABAIXO:

-- * nome = '404 Not Found';

-- * url = 'http://moodletech.azurewebsites.net/';

-- * navegador = 'Google Chrome';

-- E EXIBIR OS DADOS DA TABELA historico ONDE O nome É '404 Not Found' E O navegador É 'Google Chrome';



insert into historico (nome, url, navegador) values 

	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Google Chrome');

    

SELECT * FROM historico WHERE nome = '404 Not Found' and navegador = 'Google Chrome';



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR OS DADOS DA TABELA historico CUJO A url CONTEM A PALAVRA 'AMAZON';



select * from historico where url like '%AMAZON%';



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR OS DADOS DA TABELA historico CUJO A url TERMINA COM O CARACTER /;



select * from historico where url like '%/';



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXCLUIR A TUPLA DA TABELA historico CUJO O nome CONTÉM A PALAVRA Download;



select * from historico;

DELETE FROM historico where id = 9 and 10;



-- De acordo com o SCRIPT realize o seguinte comando:

-- INSERIR UM REGISTRO NA TABELA HISTÓRICO CONFORME DADOS ABAIXO:

-- nome = 'Fazer login no Canvas (instructure.com)'

-- url = 'https://awsacademy.instructure.com/login/canvas'

-- dataHora = '2023-02-16 10:36:00'



INSERT INTO historico (nome, url, dataHora) VALUES

	('Fazer login no Canvas (instructure.com)', 'https://awsacademy.instructure.com/login/canvas', '2023-02-16');

    

-- De acordo com o SCRIPT realize o seguinte comando:

-- EXCLUIR A TABELA historico DO BANCO DE DADOS continuada1;



-- DROP TABLE historico





-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR OS DADOS DA TABELA historico CUJO O nome COMEÇA COM A LETRA M;



SELECT * FROM historico WHERE nome LIKE 'M%';



-- De acordo com o SCRIPT realize o seguinte comando:

-- ATUALIZAR O DADO DO CAMPO dataHora DA TABELA historico PARA '2023-02-31 08:00:00' ONDE O nome É IGUAL A  'Página Inicial - Microsoft Azure';



select * from historico where nome = 'Página Inicial - Microsoft Azure';

UPDATE historico SET dataHora = '2023-02-31 08:00:00' WHERE id = 2;



-- De acordo com o SCRIPT realize o seguinte comando:

-- AUMENTAR A QUANTIDADE DE CARACTERES DO CAMPO url NA TABELA historico PARA 500 caracteres;



ALTER TABLE historico MODIFY COLUMN url VARCHAR(500);

desc historico;



-- De acordo com o SCRIPT realize o seguinte comando:

-- RENOMEAR O CAMPO nome PARA titulo DA TABELA historico;



ALTER TABLE historico RENAME COLUMN nome TO titulo;

desc historico;



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXCLUIR O CAMPO NA TABELA historico CHAMADO navegador;



ALTER TABLE historico DROP COLUMN navegador;

desc historico;



-- TESTE RAPIDO

-- alter table historico add column navegador varchar(100);

-- ALTER TABLE historico DELETE COLUMN navegador;



ALTER TABLE historico ADD COLUMN sistOp VARCHAR(30);

desc historico;



SELECT * FROM historico;



-- SELECT * FROM historico;

-- Ao realizar o comando abaixo, é correto o que se afirma em:

-- TRUNCATE TABLE historico;

-- I - O comando TRUNCATE TABLE serve para excluir a tabela;

-- II - O comando TRUNCATE TABLE é um comando DDL;

-- III - Este comando dará erro;



SELECT * FROM historico;

-- TRUNCATE TABLE historico;

-- Limparia todos os dados da tabela



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR APENAS O CAMPO navegador DA TABELA historico ONDE O navegador É DIFERENTE DE 'Microsoft Edge';



alter table historico add column navegador varchar(100);

insert into historico (titulo,url , navegador) values ('','','Microsoft Edge');

insert into historico (titulo,url , navegador) values ('','','Google Chrome');



SELECT * FROM historico WHERE navegador != 'Microsoft Edge';



-- De acordo com o SCRIPT realize o seguinte comando:

-- ATUALIZAR O DADO DO CAMPO navegador DA TABELA historico PARA 'Google Chrome' ONDE O nome É IGUAL A  'Working...';



SELECT * FROM historico WHERE titulo = 'Working...';

UPDATE historico SET navegador = 'Google Chrome' WHERE id = 5;

select * from historico;



-- De acordo com o SCRIPT realize o seguinte comando:

-- NO CAMPO navegador DA TABELA historico, ADICIONAR A CONSTRAINT CHECK PARA INSERIR NO CAMPO APENAS OS SEGUINTES DADOS:

-- 'Microsoft Edge', 'Firefox Developer Edition', 'Google Chrome';



select * from historico;

alter table historico add column navegador varchar(100);

ALTER TABLE historico ADD CONSTRAINT chk_navegador

	CHECK (navegador in ('Microsoft Edge', 'Firefox Developer Edition', 'Google Chrome'));

update historico set navegador = '' where id = 14;



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR APENAS OS NOMES DA TABELA historico CUJO O navegador É 'Microsoft Edge';



insert into historico (titulo, url, navegador) values ('Titulo Aleatorio','','Google Chrome');

SELECT titulo FROM historico WHERE navegador = 'Microsoft Edge';



-- De acordo com o SCRIPT realize o seguinte comando:

-- EXIBIR OS DADOS DA TABELA historico CUJO A url TEM COMO PENÚLTIMA LETRA, A LETRA T;



SELECT * FROM historico WHERE url LIKE '%t_';

select * from historico;