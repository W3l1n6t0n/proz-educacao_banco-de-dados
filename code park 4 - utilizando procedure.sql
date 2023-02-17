/* 
 Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos.
 Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos
 comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.
*/

CREATE DATABASE empresa_vendas;
USE empresa_vendas;

CREATE TABLE produto (
	id SERIAL PRIMARY KEY,
  	nome varchar(50) NOT NULL,
  	vendas INT NOT NULL,
  	dia DATE NOT NULL
);

INSERT INTO produto (nome, vendas, dia)
VALUES
('Panela', 24, '2023/02/12'),
('Conjunto de talheres', 51, '2023/02/09'),
('Lençol', 20, '2023/02/17'),
('Travesseiro', 37, '2023/02/11');

DELIMITER $$
CREATE PROCEDURE verProdutos()
BEGIN
	SELECT * FROM produto WHERE dia = CURRENT_DATE;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE verProdutosNome()
BEGIN
	SELECT * FROM produto WHERE nome = 'Panela';
END $$
DELIMITER ;