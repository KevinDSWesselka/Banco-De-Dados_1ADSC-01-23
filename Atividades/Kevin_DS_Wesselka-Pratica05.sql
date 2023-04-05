-- Kevin D.S. Wesselka - Pratica-05

-- Criar um banco de dados Pet no MySQL, selecionar esse banco de dados e
-- executar as instruções relacionadas a seguir.
create database db_pets;
use db_pets;

-- Criar as tabelas equivalentes à modelagem. 
create table tb_pet(
id_pet int primary key auto_increment,
nome_pet varchar(45),
dt_nascimento date,
raca varchar(45),
tipo varchar(45)
)auto_increment = 101;

create table tb_cliente(
id_cliente int primary key auto_increment,
nome_cliente varchar(45),
sobrenome_cliente varchar(45),
telefone_fix varchar(20),
telefone_cel varchar(20),
logradouro varchar(45),
numero_logradouro varchar(5),
cep char(9),
complemento varchar(45)
);

-- Regra de negocio:
-- Um Cliente tem N Pet's
-- Um Pet tem apenas Um Cliente

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
alter table tb_pet add column fk_cliente int,
	add constraint fkcliente foreign key (fk_cliente) references tb_cliente(id_cliente);
desc tb_pet;

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente,
-- e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
-- menos 2 clientes diferentes que tenham o mesmo sobrenome.
insert into tb_cliente values 
	(null, 'Kevin', 'Wesselka', '+55 (11) 11111-1111', '+55 (11) 22222-2222', 'Rua Agenor Freires de Moraes', '176', '09999-999', 'Casa'),
	(null, 'Mariana', 'Wesselka', '+55 (11) 31313-1414', '+55 (11) 21262-7252', 'Rua Lotus', '346', '06969-696', 'Casa'),
	(null, 'Julia', 'Aico', '+55 (11) 13311-1331', '+55 (11) 22112-7522', 'Wel Cometo`d Jungle', '333', '09229-949', 'Predio Azul'),
	(null, 'João', 'VScode', '+55 (11) 14411-1441', '+55 (11) 22332-8622', 'Thun Deres Truek', '10077', '09333-889', 'Condominio');
    
insert into tb_pet values 
		(null, 'Psico', '2020-04-06', 'Cairina Moschata', 'Pato', 3),
		(null, 'Neeko', '2019-05-15', 'Gato Frajola', 'Gato', 1),
		(null, 'Lyrick', '2022-03-10', 'Ragdoll', 'Gato', 2),
		(null, 'Ludyck', '2022-02-20', 'Devon Rex', 'Gato', 2),
		(null, 'Spyke', '2021-08-05', 'Pug', 'Cachorro', 4);
        
-- Exibir todos os dados de cada tabela criada, separadamente.
select * from tb_cliente;
select * from  tb_pet;

-- Altere o tamanho da coluna nome do cliente
alter table tb_cliente modify column nome_cliente varchar(55);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from tb_pet where tipo = 'Gato';

-- Exibir apenas os nomes e as datas de nascimento dos pets
select nome_pet, dt_nascimento from tb_pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from tb_pet order by nome_pet;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro
select * from tb_cliente order by logradouro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from tb_pet where nome_pet like 'L%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from tb_cliente where sobrenome_cliente = 'Wesselka';

-- Alterar o telefone de um determinado cliente.
update tb_cliente set telefone_cel = '+55 (11) 94949-9494'
	where id_cliente = 1;

-- Exibir os dados dos clientes para verificar se alterou
select * from tb_cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from tb_pet join tb_cliente 
	on fk_cliente = id_cliente;
    
-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from tb_pet join tb_cliente 
	on fk_cliente = id_cliente 
		where id_cliente = 2;

-- Excluir algum pet.
delete from tb_pet where id_pet = 105;

-- Exibir os dados dos pets para verificar se excluiu.
select * from tb_pet;

-- Excluir as tabelas.
drop table tb_cliente, tb_pet;

-- ===================================================================

-- Depois de desenhado o DER, implemente no MySQL as tabelas equivalentes ao
-- modelo que você criou e:

create database db_gasto;
use db_gasto;

-- Crie uma entidade Pessoa, com atributos idPessoa, nome, data de nascimento, profissão.
-- Crie uma outra entidade Gasto, com atributos idGasto, data, valor, descrição.

create table tb_pessoa (
id_pessoa int primary key auto_increment,
nome_pessoa varchar(45),
dt_nascimento date,
profissao varchar(45)
);

create table tb_gasto (
id_gasto int auto_increment,
dt_gasto date,
valor decimal(7,2),
descricao varchar(45),
fk_pessoa int,
constraint fkpessoa foreign key (fk_pessoa) references tb_pessoa(id_pessoa),
constraint pkpessoa primary key (id_gasto, fk_pessoa) 
);

-- Regra de negocio:
-- Uma Pessoa pode ter N gastos
-- Um gasto pode ter apenas Uma Pessoa

-- Insira dados nas tabelas.
insert into tb_pessoa values 
	(null, 'Kevin', '2003-03-03', 'DBA'),
	(null, 'Mariana', '2002-05-27', 'Psicologa'),
	(null, 'Peter', '1995-02-19', 'Aanalista');
    
insert into tb_gasto values 
	(null, '2023-04-04', '3700.20', 'Compra de um novo Notebook', 1),
	(null, '2023-04-01', '20.00', 'Compra de um Lanche no Popeys', 2),
	(null, '2023-04-05', '20000.00', 'Pagamento de dividendos', 3);
    
-- Exiba os dados de cada tabela individualmente.
select * from tb_pessoa;
select * from tb_gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da
-- tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from tb_pessoa where id_pessoa = 2;
select * from tb_gasto where id_gasto = 2;
select nome_pessoa, profissao, valor from tb_gasto join tb_pessoa
	on fk_pessoa = id_pessoa;
    
-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select nome_pessoa, valor from tb_gasto join tb_pessoa
	on fk_pessoa = id_pessoa;
    
-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from tb_gasto join tb_pessoa 
	on fk_pessoa = id_pessoa
		where id_pessoa = 1;
        
-- Atualize valores já inseridos na tabela
update tb_gasto set valor = '40.00' 
	where id_gasto = 2;
    
-- Exclua um ou mais registros de alguma tabela.
delete from tb_gasto where id_gasto = 3;

-- ===================================================================

