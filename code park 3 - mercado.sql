/*
Crie um banco de dados, adicione tabelas e determine quais são
os atributos de cada uma. Em seguida, execute um trigger que se
relacione com algum comando, como insert, select, delete ou update.
*/

CREATE DATABASE mercado;
USE mercado;

CREATE TABLE Produtos
(
	Referencia VARCHAR(3) PRIMARY KEY,
	Descricao VARCHAR(50) UNIQUE,
	Estoque	INT NOT NULL DEFAULT 0
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz', 5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);

CREATE TABLE ItensVenda
(
	Venda INT,
	Produto VARCHAR(3),
	Quantidade INT
);

DELIMITER $
CREATE TRIGGER Tgr_ItensVenda_Insert AFTER INSERT
ON ItensVenda
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
WHERE Referencia = NEW.Produto;
END$

CREATE TRIGGER Tgr_ItensVenda_Delete AFTER DELETE
ON ItensVenda
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
WHERE Referencia = OLD.Produto;
END$
DELIMITER ;

INSERT INTO ItensVenda VALUES (1, '001',3);
INSERT INTO ItensVenda VALUES (1, '002',1);
INSERT INTO ItensVenda VALUES (1, '003',5);

select * from ItensVenda;

SHOW TRIGGERS;

DROP TRIGGER Tgr_ItensVenda_Insert;