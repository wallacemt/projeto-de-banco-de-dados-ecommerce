-- Selecionar todos os clientes
SELECT * FROM clientes;

-- Selecionar um cliente específico pelo CPF
SELECT * FROM clientes WHERE cpf = '12345678901';

-- Selecionar todos os telefones de um cliente
SELECT * FROM telefones WHERE id_cliente = 1;

-- Contar quantos telefones um cliente possui
SELECT id_cliente, COUNT(*) AS total_telefones 
FROM telefones 
GROUP BY id_cliente;


-- Selecionar o endereço de um cliente específico
SELECT * FROM endereco WHERE id_cliente = 1;

-- Atualizar o endereço de um cliente
UPDATE endereco
SET cidade = 'Nova Cidade'
WHERE id_cliente = 1;

-- Selecionar todos os produtos
SELECT * FROM produtos;

-- Selecionar produtos de uma categoria específica
SELECT * FROM produtos WHERE id_categoria = 1;


-- Selecionar todas as categorias
SELECT * FROM categorias;

-- Contar quantos produtos pertencem a cada categoria
SELECT c.nome, COUNT(p.id) AS total_produtos
FROM categorias c
LEFT JOIN produtos p ON p.id_categoria = c.id
GROUP BY c.nome;


-- Selecionar todos os produtos de um pedido específico
SELECT * FROM pedidos_produtos WHERE id_pedido = 1;

-- Calcular o valor total de um pedido
SELECT SUM(pr.preco * pp.quantidade) AS total_pedido
FROM pedidos_produtos pp
INNER JOIN produtos pr ON pr.id = pp.id_produto
WHERE pp.id_pedido = 1;

-- Selecionar todos os produtos de um pedido específico
SELECT * FROM pedidos_produtos WHERE id_pedido = 1;

-- Calcular o valor total de um pedido
SELECT SUM(pr.preco * pp.quantidade) AS total_pedido
FROM pedidos_produtos pp
INNER JOIN produtos pr ON pr.id = pp.id_produto
WHERE pp.id_pedido = 1;

-- Selecionar todos os administradores
SELECT * FROM administradores;

-- Selecionar um administrador específico pelo ID
SELECT * FROM administradores WHERE id = 1;
