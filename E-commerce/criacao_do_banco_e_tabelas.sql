-- Estrutura do banco de dados para o e-commerce
create database Ecommerce

use Ecommerce

-- Tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255),
    usuario VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE
);

-- Tabela de endereços
CREATE TABLE endereco (
    id INT PRIMARY KEY IDENTITY,
    logradouro VARCHAR(255),
    complemento VARCHAR(255),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    uf CHAR(2),
    cep VARCHAR(9),
    id_cliente INT,
    CONSTRAINT FK_endereco_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de telefones
CREATE TABLE telefones (
    id INT PRIMARY KEY IDENTITY,
    telefone VARCHAR(15),
    id_cliente INT,
    CONSTRAINT FK_telefones_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de categorias
CREATE TABLE categorias (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255),
    descricao VARCHAR(255)
);

-- Tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    data_fabricacao DATE,
    preco DECIMAL(10, 2),
    id_categoria INT,
    CONSTRAINT FK_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Tabela de estoque
CREATE TABLE estoque (
    id INT PRIMARY KEY IDENTITY,
    quantidade INT,
    id_produto INT,
    CONSTRAINT FK_estoque_produto FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Tabela de carrinho
CREATE TABLE carrinho (
    id INT PRIMARY KEY IDENTITY,
    id_cliente INT,
    data_criacao DATETIME DEFAULT GETDATE(),
    ativo BIT DEFAULT 1,
    CONSTRAINT FK_carrinho_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de produtos do carrinho
CREATE TABLE carrinho_produtos (
    id INT PRIMARY KEY IDENTITY,
    id_carrinho INT,
    id_produto INT,
    quantidade INT,
    CONSTRAINT FK_carrinho_produtos_carrinho FOREIGN KEY (id_carrinho) REFERENCES carrinho(id),
    CONSTRAINT FK_carrinho_produtos_produto FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Tabela de administradores
CREATE TABLE administradores (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255),
    cpf VARCHAR(11) UNIQUE
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY IDENTITY,
    data DATE,
    id_administrador INT,
    id_cliente INT,
    CONSTRAINT FK_pedido_administrador FOREIGN KEY (id_administrador) REFERENCES administradores(id),
    CONSTRAINT FK_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de produtos dos pedidos
CREATE TABLE pedidos_produtos (
    id INT PRIMARY KEY IDENTITY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    CONSTRAINT FK_pedidos_produtos_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    CONSTRAINT FK_pedidos_produtos_produto FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Tabela de métodos de pagamento
CREATE TABLE metodos_pagamento (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(50)
);

-- Tabela de pagamentos
CREATE TABLE pagamentos (
    id INT PRIMARY KEY IDENTITY,
    id_metodo_pagamento INT,
    id_pedido INT,
    valor DECIMAL(10, 2),
    data_pagamento DATE,
    status VARCHAR(20),
    CONSTRAINT FK_pagamento_metodo FOREIGN KEY (id_metodo_pagamento) REFERENCES metodos_pagamento(id),
    CONSTRAINT FK_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
);

