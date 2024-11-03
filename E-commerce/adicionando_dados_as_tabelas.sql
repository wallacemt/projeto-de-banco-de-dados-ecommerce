use Ecommerce

-- Inserção de dados na tabela categorias
INSERT INTO categorias (nome, descricao) VALUES 
('Eletrônicos', 'Produtos eletrônicos diversos'),
('Vestuário', 'Roupas e acessórios'),
('Alimentos', 'Produtos alimentícios'),
('Livros', 'Diversos tipos de livros'),
('Móveis', 'Móveis e decorações'),
('Brinquedos', 'Brinquedos e jogos para crianças'),
('Beleza', 'Produtos de beleza e cuidados pessoais'),
('Esportes', 'Equipamentos e roupas esportivas');

-- Inserção de dados na tabela produtos
INSERT INTO produtos (nome, descricao, data_fabricacao, preco, id_categoria) VALUES 
('Smartphone', 'Celular com 128GB de armazenamento', '2023-05-12', 1500.00, 1),
('Camisa Polo', 'Camisa polo azul tamanho M', '2024-01-01', 75.00, 2),
('Café', 'Pacote de café torrado e moído 500g', '2024-06-25', 12.00, 3),
('Livro de Ficção', 'Romance de ficção científica', '2022-08-20', 45.00, 4),
('Sofá 3 Lugares', 'Sofá de couro sintético', '2023-04-10', 1200.00, 5),
('Boneca', 'Boneca de pano com vestido', '2022-12-15', 30.00, 6),
('Creme Facial', 'Creme hidratante para o rosto', '2023-02-22', 25.00, 7),
('Bola de Futebol', 'Bola oficial de futebol tamanho 5', '2024-03-30', 100.00, 8);

-- Inserção de dados na tabela estoque
INSERT INTO estoque (quantidade, id_produto) VALUES 
(50, 1),
(200, 2),
(100, 3),
(30, 4),
(10, 5),
(80, 6),
(150, 7),
(60, 8);

-- Inserção de dados na tabela clientes
INSERT INTO clientes (nome, usuario, email, cpf, data_nascimento) VALUES 
('João Silva', 'joaos', 'joao@example.com', '12345678900', '1990-05-15'),
('Maria Oliveira', 'mariao', 'maria@example.com', '23456789001', '1988-09-22'),
('Carlos Pereira', 'carlosp', 'carlos@example.com', '34567890102', '1985-12-05'),
('Ana Costa', 'anac', 'ana@example.com', '45678901203', '1995-02-14'),
('Rafael Souza', 'rafaels', 'rafael@example.com', '56789012304', '1992-07-30');

-- Inserção de dados na tabela endereço
INSERT INTO endereco (logradouro, complemento, bairro, cidade, uf, cep, id_cliente) VALUES 
('Rua A', 'Apt 101', 'Centro', 'São Paulo', 'SP', '01000-000', 1),
('Rua B', 'Casa 5', 'Jardim', 'Rio de Janeiro', 'RJ', '20000-000', 2),
('Rua C', 'Bloco 2', 'Vila', 'Belo Horizonte', 'MG', '30000-000', 3),
('Rua D', 'Sala 1', 'Industrial', 'Curitiba', 'PR', '40000-000', 4),
('Rua E', '', 'Comercial', 'Porto Alegre', 'RS', '50000-000', 5);

-- Inserção de dados na tabela telefones
INSERT INTO telefones (telefone, id_cliente) VALUES 
(11987654321, 1),
(21987654322, 2),
(31987654323, 3),
(41987654324, 4),
(51987654325, 5);

-- Inserção de dados na tabela administradores
INSERT INTO administradores (nome, cpf) VALUES 
('Pedro Albuquerque', '90123456789'),
('Juliana Fernandes', '12345678911'),
('Beatriz Abreu', '83746374095'),
('Cauê Ramos ', '84756328911'),
('Leticia Farias', '84750184752'),
('Gustavo Santos', '49576820957'),
('Wallace Santana', '69704758391'),
('Kaique Simoes ', '10294857263');

-- Inserção de dados na tabela carrinho
INSERT INTO carrinho (id_cliente, data_criacao, ativo) VALUES 
(1, '2024-08-01', 1),
(2, '2024-08-02', 1),
(3, '2024-08-03', 1),
(4, '2024-08-04', 1),
(5, '2024-08-05', 1);

-- Inserção de dados na tabela carrinho_produtos
INSERT INTO carrinho_produtos (id_carrinho, id_produto, quantidade) VALUES 
(1, 1, 2),
(1, 2, 3),
(2, 3, 1),
(2, 4, 5),
(3, 5, 2),
(3, 6, 4),
(4, 7, 1),
(5, 8, 2);

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (data, id_administrador, id_cliente) VALUES 
('2024-08-01', 1, 1),
('2024-08-02', 2, 2);

-- Inserção de dados na tabela pedidos_produtos
INSERT INTO pedidos_produtos (id_pedido, id_produto, quantidade) VALUES 
(1, 1, 1),
(1, 5, 1),
(2, 2, 2),
(2, 3, 1);

-- Inserção de dados na tabela metodos_pagamento
INSERT INTO metodos_pagamento (nome) VALUES 
('Cartão de Crédito'),
('Cartão de Débito'),
('Boleto Bancário'),
('Pix'),
('Transferência Bancária');

-- Inserção de dados na tabela pagamentos
INSERT INTO pagamentos (id_metodo_pagamento, id_pedido, valor, data_pagamento, status) VALUES 
(1, 1, 1600.00, '2024-08-01', 'Aprovado'),
(2, 2, 1800.00, '2024-08-02', 'Aprovado');
