Create database ProjetS4;
use ProjetS4;

Create table user(
    id int unsigned auto_increment primary key,
    nom varchar(20),
    mdp varchar(50),
    mail varchar(50),
    genre varchar(50),
    taille double precision ,
    poid double precision,
    objectif varchar(50),
    vola double precision
);

insert into user(nom,mdp) values('kevin','kevin');

Create table admin(
     id int unsigned auto_increment primary key,
    nom varchar(20),
    mdp varchar(50)
);
insert into admin(nom,mdp) values('jeddy','jeddy');

Create table regime(
    id int unsigned auto_increment primary key,
    nom varchar(50),
    prix double precision,
    tauxdefficacite double precision,  
    objectif varchar(50)
);

insert into regime (nom,prix,tauxdefficacite,objectif) values('regime vegetarien',10000,4,'manena')
insert into regime (nom,prix,tauxdefficacite,objectif) values('regime matavien',10000,4,'ngeza');

Create table sport(
    id int unsigned auto_increment primary key,
    nom varchar(50),
    tauxdefficacite double precision
    
    
);
insert into sport (nom,tauxdefficacite) values ('football',0.25);

Create table codeenattente(
    iduser int,
    code int
);
