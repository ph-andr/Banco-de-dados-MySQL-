/**
Agenda de contatos
@author Pedro Henrique Andrade Silva
*/
-- exibir banco de dados do servidor 
show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbteste;
-- selecionar o banco de dados 
use dbagenda;
-- verificar tabelas existentes 
show tables;
-- criando uma tabela
-- toda tabela precisa ter uma chave primária (PK)
-- int (tipo de dados -> números inteiros
-- primary key -> transformer este campo em chave primaria 
-- auto_increment _> numeração automática
-- varchar (tipo de dados equivalente a String (50) número máximo de caracteres)
-- not null -> preenchimento obrigatório 
-- não permite valores duplicados na tabela 

create table contatos(
   id int primary key auto_increment,
   nome varchar (50) not null,
   fone varchar (15) not null,
   email varchar (50) unique
);

-- descrição a tebale

describe contatos;

-- alterar o nome de um campo a tabela
alter table contatos change nome contato varchar (50) not null;

-- adicionar um novo campo(coluna) na tabela 
alter table contatos add column obs varchar (250);
describe contatos;
-- adicionar um novo campo(coluna) em um local especiífico
alter table contatos add column fone2 varchar(15) after fone; 

describe contatos;

-- modificar tipo de dados e/ou validação na coluna 
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar (250);

describe contatos;

-- excluir uma coluna da tabela
alter table contatos drop column obd;

-- exluir a tabela

