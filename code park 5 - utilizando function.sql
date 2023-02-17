/*
Uma loja tem um banco de dados que contém todo o controle de vendas de produtos
e de cadastro de clientes. Pensando nisso, crie uma função para somar todos os
clientes que foram cadastrados na loja durante um dia.
*/

DELIMITER $$
CREATE FUNCTION total_clientes()
RETURNS INT
BEGIN
	RETURN (SELECT COUNT(*) FROM cadastro_clientes WHERE data_cadastro = CURRENT_TIMESTAMP);
END $$
DELIMITER ;