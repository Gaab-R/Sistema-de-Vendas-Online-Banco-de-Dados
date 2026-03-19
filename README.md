# 🛒 Sistema de Vendas Online – Banco de Dados (BitVerso_BD)

Projeto de modelagem e implementação de um banco de dados relacional para um sistema de vendas online (e-commerce), desenvolvido com foco em organização, integridade, desempenho e escalabilidade.

O projeto simula o funcionamento da empresa fictícia *BitVerso*, permitindo o gerenciamento completo de clientes, produtos, pedidos, pagamentos e entregas.

---

## 🎯 Objetivo

Desenvolver um banco de dados robusto capaz de:

- Gerenciar operações de um e-commerce  
- Garantir integridade e consistência dos dados  
- Aplicar boas práticas de modelagem e normalização  
- Otimizar consultas e organização das informações  

---

## ⚙️ Visão geral do funcionamento

O sistema foi estruturado com base no fluxo real de um e-commerce:

### 👤 Clientes e Endereços
- Armazenamento de dados pessoais  
- Relacionamento com endereço (FK)  

### 🛍️ Produtos e Categorias
- Organização dos produtos por categorias  
- Controle de estoque e preços  

### 📦 Pedidos e ItensPedidos
- Um pedido pode conter vários produtos  
- Resolvido com tabela intermediária (N:N)  

### 💳 Pagamentos
- Controle financeiro dos pedidos  
- Registro de status e tipo de pagamento  

### 🚚 Entrega
- Gerenciamento de envio e status logístico  

---

## 🗄️ Estrutura do Banco de Dados

Tabelas implementadas:

- Endereco  
- Clientes  
- Categorias  
- Produtos  
- Pedidos  
- ItensPedidos  
- Pagamento  
- Entrega  

O banco segue normalização até a *3ª Forma Normal (3FN)*, garantindo:

- Eliminação de redundâncias  
- Integridade referencial  
- Organização lógica eficiente  

---

## 📊 Diagrama Entidade-Relacionamento (DER)

```mermaid
erDiagram

    CLIENTES {
        INT id_cliente PK
        VARCHAR nome_completo
        DATE data_nascimento
        VARCHAR email
        VARCHAR codigo_acesso
        VARCHAR telefone
        VARCHAR cpf
        DATETIME data_cadastro
        INT id_endereco FK
    }

    ENDERECO {
        INT id_endereco PK
        VARCHAR logradouro
        VARCHAR bairro
        VARCHAR numero
        VARCHAR cidade
        VARCHAR estado
        VARCHAR cep
        VARCHAR pais
    }

    CATEGORIAS {
        INT id_categoria PK
        VARCHAR nome_categoria
    }

    PRODUTOS {
        INT id_produto PK
        VARCHAR nome_produto
        DECIMAL valor_produto
        INT estoque
        INT id_categoria FK
    }

    PEDIDOS {
        INT id_pedido PK
        VARCHAR status_pedido
        DATETIME data_pedido
        INT id_cliente FK
    }

    ITENSPEDIDOS {
        INT id_item PK
        INT id_pedido FK
        INT id_produto FK
        INT quantidade
        DECIMAL preco_unitario
    }

    PAGAMENTO {
        INT id_pagamento PK
        INT id_pedido FK
        DATE data_pagamento
        DECIMAL valor_pagamento
        VARCHAR tipo_pagamento
        VARCHAR status_pagamento
    }

    ENTREGA {
        INT id_entrega PK
        INT id_pedido FK
        INT id_endereco FK
        VARCHAR status_entrega
        DATE data_envio
        DATE data_entrega
    }

    CLIENTES ||--o{ PEDIDOS : realiza
    CLIENTES }o--|| ENDERECO : possui

    PRODUTOS }o--|| CATEGORIAS : pertence

    PEDIDOS ||--o{ ITENSPEDIDOS : contem
    PRODUTOS ||--o{ ITENSPEDIDOS : compoe

    PEDIDOS ||--|| PAGAMENTO : possui
    PEDIDOS ||--|| ENTREGA : possui

    ENDERECO ||--o{ ENTREGA : destino

---

## 🔧 Funcionalidades implementadas

### 📌 CRUD (Create, Read, Update)

- *Create:* Inserção com INSERT INTO  
- *Read:* Consultas com SELECT + Views  
- *Update:* Atualização com UPDATE  
- *Delete:* Estrutura prevista (não aplicada no projeto)  

---

## 📊 Views criadas

Consultas otimizadas para análise de dados:

- *vw_PedidoDetalhado*  
  Exibe pedidos com cliente, produtos e subtotal  

- *vw_TotalGastoCliente*  
  Soma total gasto por cliente  

- *vw_BaixoEstoque*  
  Lista produtos com estoque abaixo de 5 unidades  

- *vw_PagamentoPendente*  
  Mostra pagamentos ainda não concluídos  

---

## ⚡ Recursos avançados (Banco de Dados II)

### 🔁 Functions e Stored Procedures

- calcular_total_pedido → cálculo automático do total  
- criar_pedido → encapsula criação de pedidos  
- relatorio_pedidos_cliente → relatório completo  
- atualizar_estoque → controle de estoque  
- aplicar_desconto_produtos_caros → regra de negócio  

✔️ Redução de duplicação de lógica  
✔️ Melhor organização e desempenho  

---

### ⚙️ Atomicidade e Consistência

- Uso de transações (BEGIN, COMMIT, ROLLBACK)  
- Garantia de integridade dos dados  
- Controle de concorrência com *READ COMMITTED*  

---

### 🚀 Otimização de consultas

- Redução de cálculos repetitivos  
- Uso de joins otimizados  
- Estrutura pensada para performance  

---

### 🧩 Fragmentação

- *Vertical:* separação de atributos (Produtos, Pedidos)  
- *Horizontal:* separação por instâncias (Clientes, Endereço)  

✔️ Melhor organização e desempenho  

---

### 🔐 Controle de acesso

Definição de papéis:

- Administração  
- Estoque  
- Vendas  
- Financeiro  
- Logística  
- Analytics  
- Atendimento  

---

## 🧪 Exemplos de consultas

```sql
SELECT *
FROM vw_PedidoDetalhado
ORDER BY id_pedido, nome_produto;

SELECT nome_completo, total_gasto
FROM vw_TotalGastoCliente
WHERE total_gasto > 100
ORDER BY total_gasto DESC;
