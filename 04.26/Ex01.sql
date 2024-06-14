-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE FUNCION�RIO (
cod_func varchar(255) PRIMARY KEY,
nome varchar(255)
)

CREATE TABLE PROJETOS (
cod_proj varchar(255) PRIMARY KEY,
tipo_projeto varchar(255),
descricao varchar(255),
data_inicio_alocacao varchar(255),
tempo_alocacao varchar(255)
)

CREATE TABLE CARGO (
cod_cargo varchar(255) PRIMARY KEY,
nome_cargo varchar(255),
salario varchar(255)
)

CREATE TABLE ALOCA��O (
cod_func varchar(255),
cod_proj varchar(255),
FOREIGN KEY(cod_func) REFERENCES FUNCION�RIO (cod_func),
FOREIGN KEY(cod_proj) REFERENCES PROJETOS (cod_proj)
)

CREATE TABLE REMUNERA��O (
cod_cargo varchar(255),
cod_func varchar(255),
FOREIGN KEY(cod_cargo) REFERENCES CARGO (cod_cargo)/*falha: chave estrangeira*/
)

