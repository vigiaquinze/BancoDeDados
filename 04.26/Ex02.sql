-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE ALMOXARIFADO (
numero_almoxarifado varchar(255) PRIMARY KEY,
local_almoxarifado varchar(255),
data_movimento varchar(255),
tipo_movimento varchar(255),
cod_fornecedor_entrada varchar(255),
razao_social_fornecedor varchar(255)
)

CREATE TABLE PEDIDO (
cpf varchar(255) PRIMARY KEY,
data_venda varchar(255),
cod_empregado_responsavel_saida varchar(255),
nome_departamento varchar(255),
nome_empregado_responsavel_saida varchar(255),
cod_departamento_empregado_responsavel_saida varchar(255),
nome_cliente varchar(255),
email_cliente varchar(255),
endereco_cliente varchar(255),
telefone_cliente varchar(255)
)

CREATE TABLE PRODUTO (
cod_produto varchar(255) PRIMARY KEY,
nome_produto varchar(255),
valor_produto varchar(255)
)

CREATE TABLE FORNECEDOR (
numero_almoxarifado varchar(255),
cod_produto varchar(255),
FOREIGN KEY(numero_almoxarifado) REFERENCES ALMOXARIFADO (numero_almoxarifado),
FOREIGN KEY(cod_produto) REFERENCES PRODUTO (cod_produto)
)

CREATE TABLE CLIENTE (
cpf varchar(255),
cod_produto varchar(255),
FOREIGN KEY(cpf) REFERENCES PEDIDO (cpf)/*falha: chave estrangeira*/
)

