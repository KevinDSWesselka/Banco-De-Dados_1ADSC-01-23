-- Kevin D.S. Wesselka - 14/04/2023
-- Aula 9 e 10 - Revisão e reforçoptimize
create database revisao;
use revisao;

create table treinador(
id_treinador int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45), -- + nome + sobrenome = atributo composto
telFixo char(11),
telMOvel char(12), -- + telFixo = atributo multivalorado
fk_experiente int,
constraint fkexperiente foreign key (fk_experiente) references treinador(id_treinador)
);

-- inseri os treinadores experientes, fk_experiente = null
-- inserir por ordem de ierarquia
insert into treinador values
	(null, 'Azul', 'Marinho', '11-90989798', null, null),
	(null, 'Rosa', 'Pink', null, '11-990989798', null);
select * from treinador;

-- inserir os treinadores novatos, fk_experiente tem algum valor
insert into treinador values 
	(null, 'Verde', 'Musgo', null, null, 1),
	(null, 'Amarelo', null, null, null, 1),
	(null, 'Laranja', null, null, null, 2);
select * from treinador;

-- Atualizando dados do treinador 1
update treinador set fk_experiente = 2 where id_treinador = 1;
select * from treinador;

-- Selecionando Nome dos treinadores e seus respectivos treinadores experientes
select novato.nome as NomeNovato, experiente.nome as NomeExperiente
	from treinador as novato join treinador as experiente
		on novato.id_treinador = experiente.fk_experiente;
        
-- Criando tabela nadador
create table nadador(
id_nadador int primary key auto_increment,
nome varchar(45),
dtNasc date,
fk_treinador int,
constraint fktreinador foreign key (fk_treinador) references treinador (id_treinador)
) auto_increment = 100;

insert into nadador values
	(null, 'Vermelho', '2013-10-10', 1),
	(null, 'Preto', '2005-10-10', 3),
	(null, 'Branco', '2003-10-10', 2),
	(null, 'Cinza', '2000-10-10', 2);
select * from nadador;

-- Join entre a tb nadador e treinador
select * from nadador join treinador 
	on fk_treinador = id_treinador;

-- Join entre a tb nadador e treinador com alias
select nadador.nome as NadadorNome, treinador.nome as TreinadorNome
		from nadador join treinador 
			on fk_treinador = id_treinador;

-- Join com todos os treinadores
select * from nadador right join treinador 
	on fk_treinador = id_treinador;

-- Selecionando o Nome juntando com o Sobrenome
select concat(treinador.nome, ' ',  ifnull(treinador.sobrenome, ' Silva')) as NomeCompleto
	from treinador;
    
-- Criando tabela convidado
create table convidado (
id_convidado int,
nome varchar(45),
fk_nadador int,
constraint fknadador foreign key (fk_nadador) references nadador(id_nadador),
constraint pkconvidado primary key (id_convidado, fk_nadador)
);
select * from convidado;

-- inseridno dados na tabela convidado
insert into convidado values
	(1, 'Shitzu', 1),
	(2, 'Poodle', 1),
	(1, 'Vira Lara', 2),
	(1, 'Pinscher', 3);
select * from convidado;

-- Selecionando todas as tabelas ao mesmo tempo
select * from treinador as novato join treinador as experiente 
	on novato.fk_experiente = experiente.id_treinador
		join nadador on nadador.fk_treinador = novato.id_treinador 
			join convidado on convidado.fk_nadador = nadador.id_nadador;