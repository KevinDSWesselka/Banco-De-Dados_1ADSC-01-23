create database sprint2;
use sprint2;

create table atleta (
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into atleta values
(null,'Jailson Mendes','Salto com vara','8'),
(null,'Kevin Wesselka','Salto com vara','4'),
(null,'Miguel Felipe','Natação','5'),
(null,'John Nemom','Natação','2'),
(null,'Katherine Assidentada','Volei','7'),
(null,'Prymary Key Alves','Volei','4');

create table pais(
idPais int primary key auto_increment,
nome varchar(30),
capital varchar(40)
);

insert into pais values
(null,'Republica Tcheca','Praga'),
(null,'Zimbabwe','Harare'),
(null,'Canada','Toronto');

alter table atleta add column fk_Pais int,
	add constraint fkPais foreign key (fk_pais) 
		references pais(idPais);
        
desc atleta;

update atleta set fk_pais = 1
	where idAtleta in (1,3);
    
    
update atleta set fk_pais = 2
	where idAtleta in (2,4);
    
    update atleta set fk_pais = 3
	where idAtleta in (5,6);
    
    select * from atleta;
    
    select
    atleta.*,
    pais.*
    from atleta join pais
    on atleta.fk_pais = pais.idPais;
    
    
    select  atleta.nome, pais.nome from atleta 
		join pais on atleta.fk_pais = pais.idPais;
        
        
	select atleta.*, pais.* from atleta join pais on atleta.fk_pais = pais.idPais
    where capital like 'Praga';
    
    -- ===============================================================================
    
    create table tb_musica (
    id_musica int primary key auto_increment,
    artista varchar(40),
    titulo varchar(40),
    genero varchar(40)
    );
    
    create table tb_album (
    id_album int primary key auto_increment,
    nome varchar(40),
    tipo varchar(40), 
    constraint chkTipo check (tipo in ('digital' , 'fisico')),
    dtLancamento date
    );
    
    drop table tb_album; 
    
    insert into tb_musica values 
		(null, 'Pelénics', 'Até que dibrou', 'Show de Bola'),
		(null, 'Taills Swit', 'The Fox', 'Run'),
		(null, 'Michael Jque Son', 'HI HI!', 'UUUH!');
        
	insert into tb_album values 
		(null,'bateu, chutou é gol','fisico','1995-05-09'),
		(null,'Gogo Taill','digital','2018-02-23'),
		(null,'LoveKids','fisico','1982-11-14');
        
        
        select * from tb_musica;
        select * from tb_album;
        
        alter table tb_musica add column fk_album int, add constraint fkalbum foreign key (fk_album)
			references tb_album(id_album);
            
            
		update tb_musica set fk_album = 1
         where id_musica = 1;
         
         update tb_musica set fk_album = 2
         where id_musica = 2;
         
          update tb_musica set fk_album = 3
         where id_musica = 3;
         
         select * from tb_musica;
         
         select 
         tb_musica.*, tb_album.*
         from tb_musica join tb_album
          on tb_musica.fk_album = tb_album.id_album;
          
          
          select 
          tb_musica.titulo, tb_album.nome 
          from tb_musica join tb_album 
          on tb_musica.fk_album = tb_album.id_album;
          
          
          select 
          tb_musica.*, tb_album.*
          from tb_musica join tb_album
          on tb_musica.fk_album = tb_album.id_album
          where tipo like 'fisico';
         
         
         
         
         
         
         
         
        
        
        
     
        
        
        
        
        
        
		
		
    
    
    
    




