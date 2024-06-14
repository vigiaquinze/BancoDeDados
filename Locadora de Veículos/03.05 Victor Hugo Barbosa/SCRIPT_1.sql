-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTES (
cnh varchar(11),
nome varchar(75),
cartao varchar(30),
telefone varchar(12),
id_cliente serial PRIMARY KEY,
endereco varchar(100),
email varchar(50),
cidade varchar(30),
estado varchar(2),
id_pagamento varchar(15)
);

CREATE TABLE AGÊNCIA (
numero_agencia serial PRIMARY KEY,
contato varchar(12),
endereco varchar(100),
cidade varchar(30),
estado varchar(2)
);

CREATE TABLE CARRO (
placa varchar(7),
modelo varchar(30),
ano int,
numero_agencia varchar(15),
id_carro serial PRIMARY KEY,
disponibilidade varchar(20)
);

CREATE TABLE FUNCIONÁRIO (
id_funcionario serial PRIMARY KEY,
nome varchar(75),
cargo varchar(75),
data_contratacao date,
salario numeric(5,2),
numero_agencia serial,
FOREIGN KEY(numero_agencia) REFERENCES AGÊNCIA (numero_agencia)
);

CREATE TABLE PAGAMENTO (
id_pagamento varchar(15),
valor numeric(5,2),
data_pagamento date,
forma_pagamento varchar(20),
status_pagamento varchar(20),
id_comprovante serial,
comprovante varchar(50),
PRIMARY KEY(id_pagamento,id_comprovante)
);

CREATE TABLE MANUTENÇÃO (
id_manutencao serial PRIMARY KEY,
data_manutencao varchar(50),
tipo_manutencao varchar(50),
descricao varchar(100),
km varchar(6),
custo numeric(5,2)
);

CREATE TABLE FEEDBACK (
id_feedback serial PRIMARY KEY,
comentario varchar(100),
avaliacao int,
data_feedback timestamp
);

CREATE TABLE LOCAÇÃO (
id_locacao serial PRIMARY KEY,
data_locacao varchar(50),
data_devolucao varchar(50),
valor_total varchar(50),
id_carro serial,
id_cliente serial,
FOREIGN KEY(id_carro) REFERENCES CARRO (id_carro),
FOREIGN KEY(id_cliente) REFERENCES CLIENTES (id_cliente)
);

CREATE TABLE RECEBE (
id_manutencao serial,
id_carro serial,
FOREIGN KEY(id_manutencao) REFERENCES MANUTENÇÃO (id_manutencao),
FOREIGN KEY(id_carro) REFERENCES CARRO (id_carro)
);

CREATE TABLE ENVIA (
id_envio serial PRIMARY KEY,
observacao varchar(50),
id_cliente serial,
id_feedback serial,
FOREIGN KEY(id_cliente) REFERENCES CLIENTES (id_cliente),
FOREIGN KEY(id_feedback) REFERENCES FEEDBACK (id_feedback)
);
