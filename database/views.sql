-- views.sql
-- Criação das views do banco BitVerso_BD

CREATE VIEW vw_PedidoDetalhado AS
SELECT 
    Pedidos.id_pedido,
    Clientes.nome_completo AS cliente,
    Produtos.nome_produto,
    ItensPedidos.quantidade,
    ItensPedidos.preco_unitario,
    (ItensPedidos.quantidade * ItensPedidos.preco_unitario) AS subtotal,
    Pedidos.status_pedido,
    Pedidos.data_pedido
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
JOIN ItensPedidos ON ItensPedidos.id_pedido = Pedidos.id_pedido
JOIN Produtos ON ItensPedidos.id_produto = Produtos.id_produto;

CREATE VIEW vw_TotalGastoCliente AS
SELECT 
    Clientes.id_cliente,
    Clientes.nome_completo,
    SUM(ItensPedidos.quantidade * ItensPedidos.preco_unitario) AS total_gasto
FROM Clientes
JOIN Pedidos ON Pedidos.id_cliente = Clientes.id_cliente
JOIN ItensPedidos ON ItensPedidos.id_pedido = Pedidos.id_pedido
GROUP BY Clientes.id_cliente, Clientes.nome_completo;

CREATE VIEW vw_BaixoEstoque AS
SELECT 
    Produtos.id_produto,
    Produtos.nome_produto,
    Produtos.estoque
FROM Produtos
WHERE Produtos.estoque < 5;

CREATE VIEW vw_PagamentoPendente AS
SELECT 
    Pagamento.id_pagamento,
    Clientes.nome_completo AS cliente,
    Pedidos.id_pedido,
    Pedidos.status_pedido,
    Pagamento.valor_pagamento,
    Pagamento.tipo_pagamento,
    Pagamento.status_pagamento
FROM Pagamento
JOIN Pedidos ON Pagamento.id_pedido = Pedidos.id_pedido
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
WHERE Pagamento.status_pagamento = 'Aguardando';
