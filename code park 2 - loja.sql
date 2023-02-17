/*
Desenvolva um banco de dados e relacione tabelas através 
de chaves estrangeiras ou nomes de colunas iguais. 
Siga as instruções:
crie uma base de dados; 
crie tabelas nessa base de dados;
em cada tabela, adicione atributos;
insira dados em cada tabela;
utilize os comandos Joins para realizar consultas nas tabelas. 
*/

create database loja;
use loja;

CREATE TABLE clientes(
	id_cli int auto_increment PRIMARY KEY,
	nome VARCHAR(50) not null,
    telefone int not null,
    email varchar(100)
);

insert into clientes(nome, telefone, email) values
('Bruno Henrique', 11-97856-9852, null),
('Patricia Silva', 11-99525-5874, 'pati.silva@email.com'),
('Renan Oliveira', 77-96256-0347, 'renan.oliveira@email.com');

select * from clientes;

CREATE TABLE produtos (
	id_prod int auto_increment PRIMARY KEY,
  	prod_nome VARCHAR(50) NOT NULL,
    prod_valor float not null,
    cli_id int,
	constraint foreign key (cli_id)
		references clientes (id_cli)
);

insert into produtos(prod_nome, prod_valor, cli_id) VALUES
('Camiseta', 159.99, 3),
('Vestido', 229.99, 2),
('tênis', 499.99, null);

select * from produtos;

/* Utilizando inner join */
select prod_nome, nome 
from produtos inner join clientes
on clientes.id_cli = produtos.cli_id;

/* Utilizando left join */
select prod_nome, nome 
from produtos left join clientes
on clientes.id_cli = produtos.cli_id;

/* Utilizando right join */
select prod_nome, nome
from produtos right join clientes
on clientes.id_cli = produtos.cli_id;

/* Utilizando Union para unir as duas joins */
select prod_nome, nome 
from produtos left join clientes
on clientes.id_cli = produtos.cli_id
union
select prod_nome, nome
from produtos right join clientes
on clientes.id_cli = produtos.cli_id;