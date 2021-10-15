/**
	Sitema para gestão de uma assistência técnica de computadores e periféricos
	@author Pedro Henrique Andrade Silva
**/

create database dbinfox;
use dbinfox;

create table usuarios (
	id int primary key auto_increment,
    usuario varchar (50) not null,
    login varchar (50) not null unique,
    senha varchar (250) not null,
    perfil varchar (50) not null
    );
   
-- a linha abaixo insere uma senha com criptografia 
-- md5 criptografa a senha 
insert into usuarios (usuario, login, senha, perfil)
values ('Pedro Henrique', 'admin', md5('123456'), 'administrador');
insert into usuarios(usuario, login, senha, perfil)
values ('Kelly Cristina', 'Kelly', md5('123'), 'operador');


select * from usuarios;
select * from usuarios where id=1;

-- selecionando o usuário e sua senha (tela de login)
select * from usuarios where login = 'admin' and senha = md5('123456');

update usuarios set usuario = 'Kelly Cristina dos Santos', login = 'Kellycris',
senha = md5('1234'), perfil = 'operador' where id = 1;

delete from usuarios where id = 3;

-- char (tipo de dados que aceita um String de caracteres não variavéis)
create table clientes( 
idcli int primary key auto_increment,
nome varchar (50) not null,
cep char(8),
endereco varchar (50) not null,
numero varchar (12) not null,
complemento varchar (30),
bairro varchar (50) not null,
cidade varchar (50) not null,
uf char (2) not null,
fone varchar (15) not null);

drop table clientes;
use clientes;
insert into clientes(nome, cep, endereco, numero, bairro, cidade, uf, fone)
values ('Isac', 03477000,'Rua Inconfidência', 1275, 'Vila Antonieta', 'São Paulo', 'SP', 993430287);

insert into clientes(nome, cep, endereco, numero, bairro, cidade, uf, fone)
values ('Isadora', 03477000,'Rua Inconfidência', 1275, 'Vila Antonieta', 'São Paulo', 'SP', 993430288);

insert into clientes(nome, cep, endereco, numero,  bairro, cidade, uf, fone)
values ('Ismael', 03477000,'Rua Inconfidência', 127, 'Vila Antonieta', 'São Paulo', 'SP', 993430289);

insert into clientes(nome, cep, endereco, numero, bairro, cidade, uf, fone)
values ('Arnaldo', 03477000,'Rua Inconfidência', 1275, 'Vila Antonieta', 'São Paulo', 'SP', 993430286);

insert into clientes(nome, cep, endereco, numero, bairro, cidade, uf, fone)
values ('Isac', 03477000,'Rua Inconfidência', 1275, 'Vila Antonieta', 'Minas Gerais', 'MG', 993430285);

insert into clientes(nome, cep, endereco, numero, bairro, cidade, uf, fone)
values ('Isac', 03477000,'Rua Inconfidência', 1275, 'Vila Antonieta', 'RIo de Janeiro', 'RJ', 993430283);

select * from clientes;

-- foreing key (FK) cria um relacionamento de 1 para muitos (cliente - tbos)
create table tbos (
os int primary key auto_increment,
dataos timestamp default current_timestamp,
tipo varchar(20) not null,
statusos varchar (30) not null,
equipamento varchar (200) not null,
defeito varchar (200) not null,
tecnico varchar (50),
valor decimal(10,2),
idcli int not null,
foreign key (idcli) references clientes (idcli)

);

describe tbos;

insert into tbos
(tipo, statusos, equipamento, defeito, idcli)
values
('orçamento','bancada','Notebook Lenovo G90','Não liga',1);

insert into tbos
(tipo, statusos, equipamento, defeito, tecnico, valor, idcli)
values
('orçamento','arguardando aprovação','impressora HP2020 ', 'Papel enroscando','Robson','60',1);

insert into tbos
(tipo, statusos, equipamento, defeito, tecnico, valor, idcli)
values
('serviço','retirado','Desktop', 'super aquecimento','Leandro','40',1);

insert into tbos
(tipo, statusos, equipamento, defeito, tecnico, valor, idcli)
values
('orçamento','arguardando aprovação','roteador WI-FI ', 'Interferência no sinal','José','120',1);

insert into tbos
(tipo, statusos, equipamento, defeito, tecnico, valor, idcli)
values
('serviço','aprovado','Instalação do Sitema SO Linux Mint', 'Instalar Sitema Operacional','Robson','40',1);

insert into tbos
(tipo, statusos, equipamento, defeito, tecnico, valor, idcli)
values
('serviço','retirado','Instalação do Sitema SO Linux Mint', 'Instalar Sitema Operacional','Robson','60',1);


select *from tbos;

-- união de tabelas para consultas e updates 
-- relatório 1

select * from tbos inner join clientes
on tbos.idcli = clientes.idcli;

-- relatório 2
select 
tbos.equipamento, tbos.defeito, tbos.statusos as status_os, tbos.valor, 
clientes.nome, clientes.fone
from tbos inner join clientes 
on tbos.idcli = clientes.idcli
where statusos = 'arguardando aprovação';

-- relatorios 3 (os, data formatada (dia, mês e ano) equipamento
-- defeito, valor, nome do cliente) filtrando por retirado

select
tbos.os, date_format(tbos.dataos,'%d/%m/%Y - %H:%i') as data_os,
tbos.equipamento, tbos.defeito, tbos.valor, clientes.nome as Cliente
from tbos inner join clientes on tbos.idcli = clientes.idcli
where statusos = 'retirado';

-- relatorio 4
select sum(valor) as faturamento from tbos where statusos = 'aprovado';

select sum(valor) as faturamento from tbos where statusos = 'retirado';