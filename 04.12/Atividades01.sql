--ATIVIDADE 01
SELECT CLIENTE.NOME, VENDA.DUPLIC, VENDA.VALOR
FROM CLIENTE, VENDA
WHERE CLIENTE.NOME = 'PCTEC - MICROCOMPUTADORES S/A.'
ORDER BY CLIENTE.NOME;

--ATIVIDADE 02
SELECT CLIENTE.NOME, VENDA.VENCTO
FROM CLIENTE, VENDA
WHERE VENDA.VENCTO::TEXT LIKE '2004-11-%'
ORDER BY VENDA.VENCTO;

--ATIVIDADE 03
SELECT CLIENTE.NOME, VENDA.DUPLIC, VENDA.VENCTO
FROM CLIENTE, VENDA
WHERE VENDA.VENCTO::TEXT LIKE '%-10-%'
ORDER BY VENDA.VENCTO;

--ATIVIDADE 04 E 05
SELECT CLIENTE.CODCLI, CLIENTE.NOME, COUNT (*) AS QTDE, SUM (VALOR) AS SUBTOTAL
FROM CLIENTE INNER JOIN VENDA ON CLIENTE.CODCLI = VENDA.CODCLI
GROUP BY CLIENTE.CODCLI, CLIENTE.NOME
ORDER BY CLIENTE.NOME;

--ATIVIDADE 06
SELECT CLI.NOME, COUNT (*) AS VENCIDOS
FROM CLIENTE CLI INNER JOIN VENDA VEN ON CLI.CODCLI = VEN.CODCLI
WHERE VEN.VENCTO::TEXT < '2003-12-31'
GROUP BY CLI.NOME;

--ATIVIDADE 07
SELECT CLIENTE.NOME, VENDA.VALOR, VENDA.VALOR * 0.1 AS VALORJUROS, VENDA.VALOR+VENDA.VALOR * 0.1 AS VALORCOMJUROS, VENDA.DUPLIC, VENDA.VENCTO
FROM CLIENTE, VENDA
WHERE VENDA.VENCTO::TEXT < '1999-12-31';