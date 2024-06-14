CREATE DATABASE DB_JOINS_TURMA_A;

CREATE TABLE CLIENTE (
CODCLI CHAR(3) NOT NULL PRIMARY KEY,
NOME VARCHAR(40) NOT NULL,
ENDERECO VARCHAR(50) NOT NULL,
CIDADE VARCHAR(20) NOT NULL,
ESTADO CHAR(2) NOT NULL,
CEP CHAR(9) NOT NULL);

CREATE TABLE VENDA (
DUPLIC CHAR(6) NOT NULL PRIMARY KEY,
VALOR DECIMAL(10,2) NOT NULL,
VENCTO DATE NOT NULL,
CODCLI CHAR(3) NOT NULL, FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI)
);

CREATE INDEX IDX_CODCLI_VENDA ON VENDA(CODCLI);