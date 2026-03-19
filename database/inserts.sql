-- inserts.sql
-- Inserção de dados iniciais no banco BitVerso_BD

INSERT INTO Endereco (logradouro, bairro, numero, cidade, estado, cep, pais)
VALUES
('Rua ABC', 'Jardim das Flores', '123', 'São Paulo', 'SP', '01001-000', 'Brasil'),
('Av. DEF', 'Monte Verde', '456', 'Rio de Janeiro', 'RJ', '20040-000', 'Brasil'),
('Rua GHI', 'Abracadabra', '789', 'Belo Horizonte', 'MG', '00300-060', 'Brasil');

INSERT INTO Clientes (nome_completo, data_nascimento, email, codigo_acesso, telefone, cpf, id_endereco)
VALUES
('Charles Emmanuel', '1995-03-15', 'charles.emmanuel@email.com', 'senha123', '11988887777', '123.456.789-10', 1),
('Guilherme Briggs', '1988-07-22', 'guilherme.briggs@email.com', 'acesso456', '21977776666', '987.654.321-00', 2),
('Mariana Torres', '2000-12-05', 'mariana.torres@email.com', 'pass789', '31966665555', '111.222.333-44', 3);

INSERT INTO Categorias (nome_categoria)
VALUES
('Informática'),
('Celulares e Tablets'),
('Periféricos');

INSERT INTO Produtos (nome_produto, valor_produto, estoque, id_categoria)
VALUES
('Notebook X', 3500.00, 10, 1),
('Mouse Gamer Y', 250.00, 30, 3),
('Celular X30', 7500.00, 5, 2),
('Teclado Mecânico ABC', 400.00, 15, 3),
('Monitor Z 24"', 900.00, 8, 1);

INSERT INTO Pedidos (status_pedido, id_cliente)
VALUES
('Em processamento', 1),
('Concluído', 2),
('Em processamento', 3);

INSERT INTO ItensPedidos (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 250.00),
(2, 3, 1, 7500.00),
(2, 4, 1, 400.00),
(3, 5, 1, 900.00),
(3, 2, 1, 250.00);

INSERT INTO Pagamento (id_pedido, data_pagamento, valor_pagamento, tipo_pagamento, status_pagamento)
VALUES
(1, '2025-09-10', 4000.00, 'Cartão de Crédito', 'Aprovado'),
(2, '2025-09-11', 7900.00, 'Pix', 'Aprovado'),
(3, '2025-09-12', 1150.00, 'Boleto', 'Aguardando');

INSERT INTO Entrega (id_pedido, id_endereco, status_entrega, data_envio, data_entrega)
VALUES
(1, 1, 'Em transporte', '2025-09-11', NULL),
(2, 2, 'Entregue', '2025-09-11', '2025-09-12'),
(3, 3, 'Preparando para envio', '2025-09-12', NULL);
