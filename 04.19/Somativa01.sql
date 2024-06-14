--PRIMEIRA PARTE

--1: Listar todos os pedidos com detalhes do cliente. Consulta para obter informações
--sobre os pedidos e os clientes que os fizeram.
SELECT CLIENTE.RG_CLIENTE, CLIENTE.NOME_CLIENTE, CLIENTE.ENDERECO_CLIENTE, PEDIDO.NUMERO_PEDIDO, PEDIDO.DATA_PEDIDO, PEDIDO.TOTAL_PEDIDO, PEDIDO.CODIGO_PIZZA
FROM CLIENTE INNER JOIN PEDIDO ON CLIENTE.RG_CLIENTE = PEDIDO.RG_CLIENTE
ORDER BY CLIENTE.NOME_CLIENTE;

--2: Listar todos os itens de pedidos com detalhes da pizza. Consulta para mostrar os
--itens de pedidos e os detalhes das pizzas associadas a eles.
SELECT PEDIDO.NUMERO_PEDIDO, PEDIDO.DATA_PEDIDO, PEDIDO.TOTAL_PEDIDO, PRODUTO.CODIGO_PIZZA, PRODUTO.NOME_PIZZA, PRODUTO.PRECO_PIZZA
FROM PEDIDO INNER JOIN PRODUTO ON PEDIDO.CODIGO_PIZZA = PRODUTO.CODIGO_PIZZA
ORDER BY PEDIDO.NUMERO_PEDIDO;

--3:Listar todos os funcionários com suas respectivas atribuições. Consulta para
--mostrar os funcionários e as áreas em que estão trabalhando.
SELECT * FROM FUNCIONARIO
ORDER BY SETOR_FUN;

--4:Listar todos os pedidos com status e funcionários responsáveis. Consulta para
--mostrar os pedidos, seus status e os funcionários responsáveis pelo atendimento.
SELECT PEDIDO.NUMERO_PEDIDO, PEDIDO.DATA_PEDIDO, PEDIDO.STATUS_PEDIDO, FUNCIONARIO.NOME_FUN
FROM PEDIDO INNER JOIN FUNCIONARIO ON PEDIDO.RG_FUN = FUNCIONARIO.RG_FUN
ORDER BY PEDIDO.DATA_PEDIDO;

--5:Listar todos os clientes com seus pedidos realizados. Consulta para exibir os
--clientes e todos os pedidos que eles fizeram.
SELECT CLIENTE.RG_CLIENTE, CLIENTE.NOME_CLIENTE, PEDIDO.DATA_PEDIDO, PEDIDO.CODIGO_PIZZA, PEDIDO.STATUS_PEDIDO, PEDIDO.TOTAL_PEDIDO
FROM CLIENTE INNER JOIN PEDIDO ON CLIENTE.RG_CLIENTE = PEDIDO.RG_CLIENTE
ORDER BY CLIENTE.NOME_CLIENTE;

--6:Listar todas as pizzas disponíveis com seus respectivos ingredientes. Consulta
--para mostrar todas as pizzas disponíveis e seus ingredientes.
SELECT * FROM PRODUTO WHERE DISPONIBILIDADE_PIZZA = TRUE;

--7:Listar todos os pedidos com detalhes de entrega (se disponível). Consulta para
--mostrar os pedidos com detalhes de entrega, se disponíveis.
SELECT PEDIDO.NUMERO_PEDIDO, PEDIDO.DATA_PEDIDO, PEDIDO.CODIGO_PIZZA, PEDIDO.TOTAL_PEDIDO, CLIENTE.ENDERECO_CLIENTE, CLIENTE.NOME_CLIENTE
FROM PEDIDO INNER JOIN CLIENTE ON PEDIDO.RG_CLIENTE = CLIENTE.RG_CLIENTE
WHERE STATUS_PEDIDO != 'CONCLUÍDO'
ORDER BY PEDIDO.DATA_PEDIDO;

--9: Listar todos os itens de pedidos com seus respectivos tamanhos. Consulta para
--mostrar os itens de pedidos e os tamanhos das pizzas associadas a eles.
SELECT * FROM PEDIDO
ORDER BY PEDIDO.DATA_PEDIDO;

--10: Listar todas as pizzas com suas respectivas promoções. Consulta para mostrar
--todas as pizzas e suas promoções, se houver.
SELECT PRODUTO.NOME_PIZZA, PRODUTO.PRECO_PIZZA
FROM PRODUTO
ORDER BY PRODUTO.CODIGO_PIZZA;

--SEGUNDA PARTE
--1: Listar todos os clientes cadastrados. Consulta para recuperar todos os clientes
--que já fizeram pedidos na pizzaria.
SELECT * FROM CLIENTE;

--2: Listar todos os pedidos realizados em um determinado período. Consulta para
--visualizar todos os pedidos feitos dentro de um intervalo de datas específico.
SELECT * FROM PEDIDO WHERE PEDIDO.DATA_PEDIDO::TEXT > '2024-04-19 19:45';

--3: Listar os itens de um pedido específico. Consulta para ver todos os itens (pizzas,
--bebidas, etc.) em um pedido específico.
SELECT PEDIDO.NUMERO_PEDIDO, PEDIDO.DATA_PEDIDO, PEDIDO.TOTAL_PEDIDO, PEDIDO.RG_CLIENTE, PEDIDO.CODIGO_PIZZA, PEDIDO.STATUS_PEDIDO, PEDIDO.RG_FUN, PRODUTO.CODIGO_PIZZA, PRODUTO.NOME_PIZZA, PEDIDO.TAMANHO_PIZZA
FROM PEDIDO, PRODUTO
WHERE PEDIDO.NUMERO_PEDIDO = 8;

--4: Calcular o total gasto por um cliente. Consulta para somar o valor de todos os
--pedidos feitos por um cliente específico.
SELECT CLIENTE.NOME_CLIENTE, SUM (PEDIDO.TOTAL_PEDIDO) AS TOTAL_GASTO
FROM CLIENTE INNER JOIN PEDIDO ON CLIENTE.RG_CLIENTE = PEDIDO.RG_CLIENTE
GROUP BY CLIENTE.NOME_CLIENTE;

--5: Listar os sabores de pizza mais populares. Consulta para mostrar os sabores de
--pizza mais pedidos pelos clientes.
SELECT PRODUTO.NOME_PIZZA, COUNT (PEDIDO.CODIGO_PIZZA) AS QTDE
FROM PRODUTO INNER JOIN PEDIDO ON PRODUTO.CODIGO_PIZZA = PEDIDO.CODIGO_PIZZA
GROUP BY PRODUTO.NOME_PIZZA;

--6: Verificar a disponibilidade de um determinado sabor de pizza. Consulta para
--verificar se um sabor específico de pizza está disponível no momento.
SELECT PRODUTO.CODIGO_PIZZA, PRODUTO.NOME_PIZZA, PRODUTO.PRECO_PIZZA, PRODUTO.DISPONIBILIDADE_PIZZA
FROM PRODUTO;

--7: Listar todos os funcionários. Consulta para recuperar informações de todos os
--funcionários da pizzaria.
SELECT * FROM FUNCIONARIO;

--8: Verificar o horário de funcionamento da pizzaria. Consulta para saber os horários
--de abertura e fechamento da pizzaria.
SELECT * FROM HORARIO_FUNCIONAMENTO;

--9: Listar os pedidos em andamento. Consulta para ver todos os pedidos que ainda
--não foram entregues.