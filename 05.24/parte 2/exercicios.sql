--Exercício 1
SELECT * FROM public.clientes
ORDER BY id_cliente ASC 

--Exercício 4
SELECT * FROM public.funcionarios
ORDER BY id_funcionario ASC 

--Exercício 5
SELECT * FROM public.locacao
WHERE id_carro = '10'
ORDER BY id_cliente ASC

--Exercício 12
SELECT clientes.nome, carro.modelo
FROM clientes
LEFT JOIN locacao ON clientes.id_cliente = locacao.id_cliente
LEFT JOIN carro ON locacao.id_carro = carro.id_carro
ORDER BY clientes.nome ASC;

--Exercício 14
SELECT reserva.id_cliente, clientes.nome, reserva.id_carro
FROM reserva
LEFT JOIN clientes on reserva.id_cliente = clientes.id_cliente
ORDER BY clientes.nome ASC;