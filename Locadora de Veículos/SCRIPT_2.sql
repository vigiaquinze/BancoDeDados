
-- Inserts na tabela clientes
INSERT INTO clientes (cnh, nome, cartao, telefone, endereco, email, cidade, estado, id_pagamento) VALUES 
('12345678901', 'João Silva', '1234567890123456', '1234567890', 'Rua das Flores, 123', 'joao@email.com', 'São Paulo', 'SP', 'PGMNT123456'),
('98765432109', 'Maria Oliveira', '9876543210987654', '9876543210', 'Avenida Principal, 456', 'maria@email.com', 'Rio de Janeiro', 'RJ', 'PGMNT987654'),
('45678901234', 'Pedro Souza', '4567890123456789', '4567890123', 'Rua do Comércio, 789', 'pedro@email.com', 'Belo Horizonte', 'MG', 'PGMNT456789'),
('78901234567', 'Ana Santos', '7890123456789012', '7890123456', 'Rua das Palmeiras, 456', 'ana@email.com', 'Porto Alegre', 'RS', 'PGMNT789012'),
('23456789012', 'Carlos Pereira', '2345678901234567', '2345678901', 'Avenida Central, 890', 'carlos@email.com', 'Brasília', 'DF', 'PGMNT234567'),
('56789012345', 'Mariana Fernandes', '5678901234567890', '5678901234', 'Rua da Paz, 123', 'mariana@email.com', 'Salvador', 'BA', 'PGMNT567890'),
('90123456789', 'Fernando Costa', '9012345678901234', '9012345678', 'Avenida dos Sonhos, 456', 'fernando@email.com', 'Curitiba', 'PR', 'PGMNT901234'),
('34567890123', 'Patrícia Lima', '3456789012345678', '3456789012', 'Rua da Amizade, 789', 'patricia@email.com', 'Fortaleza', 'CE', 'PGMNT345678'),
('67890123456', 'Rafaela Almeida', '6789012345678901', '6789012345', 'Avenida da Liberdade, 123', 'rafaela@email.com', 'Recife', 'PE', 'PGMNT678901'),
('12398765432', 'Paulo Oliveira', '1239876543212345', '1239876543', 'Rua das Oliveiras, 456', 'paulo@email.com', 'Manaus', 'AM', 'PGMNT123987'),
('32178945601', 'Luana Silva', '3217894560123456', '3217894560', 'Avenida da Esperança, 789', 'luana@email.com', 'Goiânia', 'GO', 'PGMNT321789'),
('78945612309', 'Lucas Santos', '7894561230987654', '7894561230', 'Rua dos Sonhos, 123', 'lucas@email.com', 'Vitória', 'ES', 'PGMNT789456'),
('45612378901', 'Bruna Pereira', '4561237890123456', '4561237890', 'Avenida das Flores, 456', 'bruna@email.com', 'Florianópolis', 'SC', 'PGMNT456123'),
('98745632109', 'Gustavo Fernandes', '9874563210987654', '9874563210', 'Rua da Harmonia, 789', 'gustavo@email.com', 'Natal', 'RN', 'PGMNT987456'),
('65412378901', 'Carolina Costa', '6541237890123456', '6541237890', 'Avenida Central, 123', 'carolina@email.com', 'Maceió', 'AL', 'PGMNT654123'),
('32178965401', 'Thiago Lima', '3217896540123456', '3217896540', 'Rua da Alegria, 456', 'thiago@email.com', 'João Pessoa', 'PB', 'PGMNT321789'),
('98765478901', 'Camila Almeida', '9876547890123456', '9876547890', 'Avenida dos Girassóis, 789', 'camila@email.com', 'Teresina', 'PI', 'PGMNT987654'),
('45678965401', 'Juliana Oliveira', '4567896540123456', '4567896540', 'Rua das Rosas, 123', 'juliana@email.com', 'Cuiabá', 'MT', 'PGMNT456789'),
('65498732109', 'Marcos Santos', '6549873210987654', '6549873210', 'Avenida da Felicidade, 456', 'marcos@email.com', 'Campo Grande', 'MS', 'PGMNT654987'),
('32145698709', 'Helena Pereira', '3214569870987654', '3214569870', 'Rua da Liberdade, 789', 'helena@email.com', 'Boa Vista', 'RR', 'PGMNT321456');

-- Inserts na tabela agencia
INSERT INTO agencia (contato, endereco, cidade, estado) VALUES 
('1234567890', 'Rua Principal, 123', 'São Paulo', 'SP'),
('9876543210', 'Avenida Central, 456', 'Rio de Janeiro', 'RJ'),
('4567890123', 'Avenida das Flores, 789', 'Belo Horizonte', 'MG'),
('7890123456', 'Rua da Amizade, 123', 'Porto Alegre', 'RS'),
('2345678901', 'Avenida da Liberdade, 456', 'Brasília', 'DF'),
('5678901234', 'Rua da Esperança, 789', 'Salvador', 'BA'),
('9012345678', 'Avenida dos Sonhos, 123', 'Curitiba', 'PR'),
('3456789012', 'Rua das Rosas, 456', 'Fortaleza', 'CE'),
('6789012345', 'Avenida da Felicidade, 789', 'Recife', 'PE'),
('1239876543', 'Rua da Harmonia, 123', 'Manaus', 'AM');

-- Inserts na tabela carro
INSERT INTO carro (placa, modelo, ano, numero_agencia, disponibilidade) VALUES 
('ABC1234', 'Gol', 2018, '1', 'Disponível'),
('DEF5678', 'Uno', 2019, '2', 'Disponível'),
('GHI9012', 'Onix', 2020, '3', 'Disponível'),
('JKL3456', 'HB20', 2017, '4', 'Disponível'),
('MNO7890', 'Civic', 2016, '5', 'Disponível'),
('PQR1234', 'Corolla', 2018, '6', 'Disponível'),
('STU5678', 'Fiesta', 2019, '7', 'Disponível'),
('VWX9012', 'Prisma', 2020, '8', 'Disponível'),
('YZA3456', 'Cruze', 2017, '9', 'Disponível'),
('BCD7890', 'HR-V', 2016, '10', 'Disponível');

-- Inserts na tabela funcionario
INSERT INTO funcionario (nome, cargo, data_contratacao, salario, numero_agencia) VALUES 
('José Silva', 'Gerente', '2020-01-15', 4000.00, 1),
('Maria Santos', 'Atendente', '2020-02-20', 2500.00, 2),
('Carlos Oliveira', 'Atendente', '2020-03-10', 2500.00, 3),
('Ana Costa', 'Gerente', '2019-11-05', 4000.00, 4),
('Paulo Pereira', 'Atendente', '2020-05-08', 2500.00, 5),
('Luiza Fernandes', 'Atendente', '2020-07-12', 2500.00, 6),
('Felipe Almeida', 'Gerente', '2020-04-25', 4000.00, 7),
('Amanda Lima', 'Atendente', '2020-06-30', 2500.00, 8),
('Fernando Castro', 'Atendente', '2019-09-15', 2500.00, 9),
('Juliana Costa', 'Gerente', '2019-12-20', 4000.00, 10);

-- Inserts na tabela pagamento
INSERT INTO pagamento (id_pagamento, valor, data_pagamento, forma_pagamento, status_pagamento, comprovante) VALUES 
('PGMNT123456', 1500.00, '2024-04-01', 'Cartão de Crédito', 'Pago', 'Comprovante123456.pdf'),
('PGMNT987654', 2000.00, '2024-04-02', 'Boleto Bancário', 'Pago', 'Comprovante987654.pdf'),
('PGMNT456789', 1800.00, '2024-04-03', 'Transferência Bancária', 'Pago', 'Comprovante456789.pdf'),
('PGMNT789012', 1600.00, '2024-04-04', 'Dinheiro', 'Pago', 'Comprovante789012.pdf'),
('PGMNT234567', 1700.00, '2024-04-05', 'Cartão de Débito', 'Pago', 'Comprovante234567.pdf'),
('PGMNT567890', 1900.00, '2024-04-06', 'Cheque', 'Pago', 'Comprovante567890.pdf'),
('PGMNT901234', 2200.00, '2024-04-07', 'Transferência Bancária', 'Pago', 'Comprovante901234.pdf'),
('PGMNT345678', 2100.00, '2024-04-08', 'Boleto Bancário', 'Pago', 'Comprovante345678.pdf'),
('PGMNT678901', 2300.00, '2024-04-09', 'Cartão de Crédito', 'Pago', 'Comprovante678901.pdf'),
('PGMNT123987', 2400.00, '2024-04-10', 'Dinheiro', 'Pago', 'Comprovante123987.pdf');

-- Inserts na tabela manutencao
INSERT INTO manutencao (data_manutencao, tipo_manutencao, descricao, km, custo) VALUES 
('2024-03-01', 'Troca de óleo', 'Troca de óleo e filtro', '50000', 100.00),
('2024-03-15', 'Revisão', 'Revisão preventiva', '60000', 200.00),
('2024-04-01', 'Troca de pneus', 'Troca dos pneus dianteiros', '65000', 300.00),
('2024-04-20', 'Alinhamento', 'Alinhamento e balanceamento', '70000', 150.00),
('2024-05-05', 'Troca de pastilhas', 'Troca das pastilhas de freio', '75000', 180.00);

-- Inserts na tabela feedback
INSERT INTO feedback (comentario, avaliacao, data_feedback) VALUES 
('Atendimento excelente!', 5, CURRENT_TIMESTAMP),
('Carro com problemas mecânicos.', 2, CURRENT_TIMESTAMP),
('O carro estava sujo.', 3, CURRENT_TIMESTAMP),
('Processo de locação muito demorado.', 2, CURRENT_TIMESTAMP),
('Ótimo serviço de atendimento ao cliente.', 5, CURRENT_TIMESTAMP);

-- Inserts na tabela locacao
INSERT INTO locacao (data_locacao, data_devolucao, valor_total, id_carro, id_cliente) VALUES 
('2024-04-01', '2024-04-10', '500.00', 1, 1),
('2024-04-02', '2024-04-11', '600.00', 2, 2),
('2024-04-03', '2024-04-12', '700.00', 3, 3),
('2024-04-04', '2024-04-13', '800.00', 4, 4),
('2024-04-05', '2024-04-14', '900.00', 5, 5),
('2024-04-06', '2024-04-15', '1000.00', 6, 6),
('2024-04-07', '2024-04-16', '1100.00', 7, 7),
('2024-04-08', '2024-04-17', '1200.00', 8, 8),
('2024-04-09', '2024-04-18', '1300.00', 9, 9),
('2024-04-10', '2024-04-19', '1400.00', 10, 10);

-- Inserts na tabela recebe
INSERT INTO recebe (id_manutencao, id_carro) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserts na tabela envia
INSERT INTO envia (observacao, id_cliente, id_feedback) VALUES

 
('Gostei muito do serviço prestado.', 1, 1),
('Precisam melhorar a limpeza dos carros.', 2, 2),
('Atendimento rápido e eficiente.', 3, 3),
('Esperava mais rapidez no processo de locação.', 4, 4),
('Parabéns pelo excelente atendimento!', 5, 5);

-- Inserts adicionais na tabela clientes
INSERT INTO clientes (cnh, nome, cartao, telefone, endereco, email, cidade, estado, id_pagamento) VALUES 
('76543210987', 'Mateus Silva', '7654321098765432', '7654321098', 'Rua das Flores, 789', 'mateus@email.com', 'São Paulo', 'SP', 'PGMNT765432'),
('09876543210', 'Laura Oliveira', '0987654321098765', '0987654321', 'Avenida Principal, 123', 'laura@email.com', 'Rio de Janeiro', 'RJ', 'PGMNT098765'),
('98765432109', 'Giovanni Souza', '9876543210987654', '9876543210', 'Rua do Comércio, 456', 'giovanni@email.com', 'Belo Horizonte', 'MG', 'PGMNT987654'),
('45678901234', 'Gabrielle Santos', '4567890123456789', '4567890123', 'Avenida dos Estados, 789', 'gabrielle@email.com', 'Porto Alegre', 'RS', 'PGMNT456789'),
('65432109876', 'Rafaela Costa', '6543210987654321', '6543210987', 'Rua da Independência, 456', 'rafaela@email.com', 'Brasília', 'DF', 'PGMNT654321'),
('89012345678', 'Leandro Pereira', '8901234567890123', '8901234567', 'Avenida dos Sonhos, 890', 'leandro@email.com', 'Salvador', 'BA', 'PGMNT890123'),
('32109876543', 'Isabella Fernandes', '3210987654321098', '3210987654', 'Rua das Américas, 123', 'isabella@email.com', 'Curitiba', 'PR', 'PGMNT321098'),
('56789012345', 'Lucas Oliveira', '5678901234567890', '5678901234', 'Avenida da Liberdade, 456', 'lucas@email.com', 'Fortaleza', 'CE', 'PGMNT567890'),
('23456789012', 'Thais Lima', '2345678901234567', '2345678901', 'Rua da Harmonia, 789', 'thais@email.com', 'Recife', 'PE', 'PGMNT234567'),
('98765432109', 'Eduardo Almeida', '9876543210987654', '9876543210', 'Avenida das Rosas, 123', 'eduardo@email.com', 'Manaus', 'AM', 'PGMNT987654');

-- Inserts adicionais na tabela agencia
INSERT INTO agencia (contato, endereco, cidade, estado) VALUES 
('7654321098', 'Rua da Liberdade, 789', 'São Paulo', 'SP'),
('0987654321', 'Avenida Principal, 123', 'Rio de Janeiro', 'RJ'),
('9876543210', 'Rua do Comércio, 456', 'Belo Horizonte', 'MG'),
('4567890123', 'Avenida dos Estados, 789', 'Porto Alegre', 'RS'),
('6543210987', 'Rua da Independência, 456', 'Brasília', 'DF'),
('8901234567', 'Avenida dos Sonhos, 890', 'Salvador', 'BA'),
('3210987654', 'Rua das Américas, 123', 'Curitiba', 'PR'),
('5678901234', 'Avenida da Liberdade, 456', 'Fortaleza', 'CE'),
('2345678901', 'Rua da Harmonia, 789', 'Recife', 'PE'),
('9876543210', 'Avenida das Rosas, 123', 'Manaus', 'AM');

-- Inserts adicionais na tabela carro
INSERT INTO carro (placa, modelo, ano, numero_agencia, disponibilidade) VALUES 
('EFG7890', 'Tucson', 2018, '1', 'Disponível'),
('HIJ9012', 'Compass', 2019, '2', 'Disponível'),
('KLM3456', 'EcoSport', 2020, '3', 'Disponível'),
('NOP7890', 'Tracker', 2017, '4', 'Disponível'),
('QRS1234', 'HR-V', 2018, '5', 'Disponível'),
('TUV5678', 'Kicks', 2019, '6', 'Disponível'),
('WXY9012', 'Creta', 2020, '7', 'Disponível'),
('ZAB3456', 'Renegade', 2017, '8', 'Disponível'),
('CDE7890', 'Corolla', 2016, '9', 'Disponível'),
('FGH1234', 'Fusion', 2018, '10', 'Disponível');

-- Inserts adicionais na tabela funcionario
INSERT INTO funcionario (nome, cargo, data_contratacao, salario, numero_agencia) VALUES 
('Rodrigo Oliveira', 'Gerente', '2019-12-10', 4000.00, 1),
('Tatiane Costa', 'Atendente', '2020-01-20', 2500.00, 2),
('Cristiano Santos', 'Atendente', '2020-02-15', 2500.00, 3),
('Patricia Pereira', 'Gerente', '2020-03-05', 4000.00, 4),
('Marcelo Almeida', 'Atendente', '2020-04-08', 2500.00, 5),
('Aline Silva', 'Atendente', '2020-05-12', 2500.00, 6),
('Roberto Fernandes', 'Gerente', '2020-06-25', 4000.00, 7),
('Tatiana Lima', 'Atendente', '2020-07-30', 2500.00, 8),
('Vinicius Oliveira', 'Atendente', '2020-08-15', 2500.00, 9),
('Fernanda Costa', 'Gerente', '2020-09-20', 4000.00, 10);

-- Inserts adicionais na tabela pagamento
INSERT INTO pagamento (id_pagamento, valor, data_pagamento, forma_pagamento, status_pagamento, comprovante) VALUES 
('PGMNT765432', 2500.00, '2024-04-20', 'Cartão de Crédito', 'Pago', 'Comprovante765432.pdf'),
('PGMNT098765', 2800.00, '2024-04-21', 'Boleto Bancário', 'Pago', 'Comprovante098765.pdf'),
('PGMNT987654', 2700.00, '2024-04-22', 'Transferência Bancária', 'Pago', 'Comprovante987654.pdf'),
('PGMNT456789', 2600.00, '2024-04-23', 'Dinheiro', 'Pago', 'Comprovante456789.pdf'),
('PGMNT654321', 2900.00, '2024-04-24', 'Cartão de Débito', 'Pago', 'Comprovante654321.pdf'),
('PGMNT890123', 3000.00, '2024-04-25', 'Cheque', 'Pago', 'Comprovante890123.pdf'),
('PGMNT321098', 3100.00, '2024-04-26', 'Transferência Bancária', 'Pago', 'Comprovante321098.pdf'),
('PGMNT567890', 3200.00, '2024-04-27', 'Boleto Bancário', 'Pago', 'Comprovante567890.pdf'),
('PGMNT234567', 3300.00, '2024-04-28', 'Cartão de Crédito', 'Pago', 'Comprovante234567.pdf'),
('PGMNT987654', 3400.00, '2024-04-29', 'Dinheiro', 'Pago', 'Comprovante987654.pdf');

-- Inserts adicionais na tabela manutencao
INSERT INTO manutencao (data_manutencao, tipo_manutencao, descricao, km, custo) VALUES 
('2024-04-10', 'Troca de óleo', 'Troca de óleo e filtro', '55000', 120.00),
('2024-04-15', 'Revisão', 'Revisão preventiva', '60000', 200.00),
('2024-04-20', 'Troca de pneus', 'Troca dos pneus dianteiros', '65000', 300.00),
('2024-04-25', 'Alinhamento', 'Alinhamento e balanceamento', '70000', 150.00),
('2024-05-01', 'Troca de pastilhas', 'Troca das pastilhas de freio', '75000', 180.00),
('2024-05-05', 'Troca de óleo', 'Troca de óleo e filtro', '80000', 120.00),
('2024-05-10', 'Revisão', 'Revisão preventiva', '85000', 200.00),
('2024-05-15', 'Troca de pneus', 'Troca dos pneus dianteiros', '90000', 300.00),
('2024-05-20', 'Alinhamento', 'Alinhamento e balanceamento', '95000', 150.00),
('2024-05-25', 'Troca de pastilhas', 'Troca das pastilhas de freio', '100000', 180.00);

-- Inserts adicionais na tabela feedback
INSERT INTO feedback (comentario, avaliacao, data_feedback) VALUES 
('Atendimento excelente!', 5, CURRENT_TIMESTAMP),
('Carro com problemas mecânicos.', 2, CURRENT_TIMESTAMP),
('O carro estava sujo.', 3, CURRENT_TIMESTAMP),
('Processo de locação muito demorado.', 2, CURRENT_TIMESTAMP),
('Ótimo serviço de atendimento ao cliente.', 5, CURRENT_TIMESTAMP),
('Fiquei muito satisfeito com o carro alugado.', 4, CURRENT_TIMESTAMP),
('Precisam melhorar a limpeza interna dos carros.', 3, CURRENT_TIMESTAMP),
('Atendimento rápido e eficiente.', 5, CURRENT_TIMESTAMP),
('Facilidade no processo de locação.', 4, CURRENT_TIMESTAMP),
('Excelente estado de conservação dos veículos.', 5, CURRENT_TIMESTAMP);

-- Inserts adicionais na tabela locacao
INSERT INTO locacao (data_locacao, data_devolucao, valor_total, id_carro, id_cliente) VALUES 
('2024-04-20', '2024-04-30', '600.00', 1, 1),
('2024-04-21', '2024-05-01', '700.00', 2, 2),
('2024-04-22', '2024-05-02', '800.00', 3, 3),
('2024-04-23', '2024-05-03', '900.00', 4, 4),
('2024-04-24', '2024-05-04', '1000.00', 5, 5),
('2024-04-25', '2024-05-05', '1100.00', 6, 6),
('2024-04-26', '2024-05-06', '1200.00', 7, 7),
('2024-04-27', '2024-05-07', '1300.00', 8, 8),
('2024-04-28', '2024-05-08', '1400.00', 9, 9),
('2024-04-29', '2024-05-09', '1500.00', 10, 10);

-- Inserts adicionais na tabela recebe
INSERT INTO recebe (id_manutencao, id_carro) VALUES 
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- Inserts adicionais na tabela envia
INSERT INTO envia (observacao, id_cliente, id_feedback) VALUES
('Ótimo atendimento, pessoal muito prestativo.', 6, 6),
('Carro com cheiro de cigarro, precisa de mais limpeza.', 7, 7),
('Rápida resolução de problemas, recomendo.', 8, 8),
('Fácil e rápido aluguel de carro.', 9, 9),
('Veículo impecável, tudo funcionando perfeitamente.', 10, 10);
