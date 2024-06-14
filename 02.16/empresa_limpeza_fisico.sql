-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE clientes (
id_cliente int (auto-incr) PRIMARY KEY,
telefone_cliente varchar (15),
email_cliente varchar (100),
endereco_cliente varchar (255),
cpf_cliente varchar (15),
genero_cliente varchar (50),
nome_cliente varchar (255),
nascimento_cliente date
)

CREATE TABLE vendas (
id_venda int (auto-incr) PRIMARY KEY,
quantidade_venda int,
valor_venda money,
id_produto int (auto-incr),
id_cliente int (auto-incr),
data_venda datetime
)

CREATE TABLE estoque (
id_produto int (auto-incr) PRIMARY KEY,
quantidade_estoque int,
nome_produto varchar (255),
categoria_produto varchar (255),
nome_fornecedor varchar (255)
)

CREATE TABLE fornecedores (
id_fornecedor int (auto-incr) PRIMARY KEY,
nome_fornecedor varchar (100),
categoria_fornecedor varchar (50),
telefone_fornecedor varchar (15),
email_fornecedor varchar (100)
)

CREATE TABLE funcionarios (
id_funcionario int (auto-incr) PRIMARY KEY,
cpf_funcionario varchar (15),
email_funcionario varchar (100),
salario_funcionario money,
telefone_funcionario varchar (15),
admissao_funcionario date,
setor_funcionario varchar (100),
cargo_funcionario varchar (100),
nome_funcionario varchar (255),
genero_funcionario varchar (50)
)

CREATE TABLE produtos (
id_produto int (auto-incr) PRIMARY KEY,
nome_fornecedor varchar (100),
categoria_produto varchar (100),
nome_produto varchar (255),
status_produto varchar (50),
valor_produto money,
quantidade_produto int
)

