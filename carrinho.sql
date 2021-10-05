
/**
Agenda de contatos
@author Pedro Henrique Andrade Silva
*/

create database dbloja;

use dbloja;

-- decimal (tipo de dado númerico não inteiro 10,2 dez digitos com 2 casas decimais de precisão)
create table carrinho(
	codigo int primary key auto_increment,
	produto varchar (250) not null, 
	quantidade int not null,
	valor decimal (10,2) not null
);

describe carrinho;

drop table carrinho;

-- CRUD Create
insert into carrinho (produto,quantidade,valor)
values ('Caneta bic azul CX30', 10, 17.50);

insert into carrinho (produto,quantidade,valor)
values ('Caneta bic preta CX30', 10, 17.50);

insert into carrinho (produto,quantidade,valor)
values ('Caneta bic vermelho CX30', 10, 17.50);

insert into carrinho (produto,quantidade,valor)
values ('Corretivo FaberCastel CX10', 10, 20.99);

insert into carrinho (produto,quantidade,valor)
values ('Apontador bic CX30', 10, 13.50);

insert into carrinho (produto,quantidade,valor)
values ('lapis FaberCastel CX40', 10, 20.50);

insert into carrinho (produto,quantidade, valor)
values ('compasso', 30, 46.56);

-- CRUD Read
select * from carrinho; 

-- operações matemáticas
select sum(valor * quantidade) as total from carrinho;

select * from carrinho where produto like 'C%';
select * from carrinho where produto like 'A%';

-- updates
update carrinho set produto = 'compasso',quantidade = 40,valor = 53.45 where codigo = 11;

select * from carrinho;


