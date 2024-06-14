SELECT venda.DUPLIC, cliente.NOME
FROM cliente, venda
WHERE cliente.CODCLI = venda.CODCLI;

SELECT VENDA.DUPLIC, CLIENTE.NOME
FROM CLIENTE INNER JOIN VENDA ON CLIENTE.CODCLI = VENDA.CODCLI;

SELECT VEN.DUPLIC, CLI.NOME
FROM CLIENTE CLI INNER JOIN VENDA VEN ON CLI.CODCLI = VEN.CODCLI
ORDER BY CLI.NOME;

SELECT CLIENTE.NOME, COUNT(*) AS QTDE
FROM CLIENTE INNER JOIN VENDA ON CLIENTE.CODCLI = VENDA.CODCLI
GROUP BY CLIENTE.NOME;