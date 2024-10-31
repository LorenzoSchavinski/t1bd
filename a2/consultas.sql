--A)---
SELECT 
    CLIENTE.nome AS cliente,
    CIDADE.nome AS cidade
FROM 
    CLIENTE
JOIN 
    ENDERECO ON CLIENTE.cod_cliente = ENDERECO.cod_cliente
JOIN 
    CIDADE ON ENDERECO.cod_cidade = CIDADE.cod_cidade;

--B)----
SELECT 
    CATEGORIA.nome AS categoria,
    COUNT(PRODUTO.cod_produto) AS total_produtos
FROM 
    CATEGORIA
LEFT JOIN 
    PRODUTO ON CATEGORIA.cod_categoria = PRODUTO.cod_categoria
GROUP BY 
    CATEGORIA.nome;

---C)--- 
SELECT 
    PRODUTO.nome AS produto,
    COUNT(ITEM_PEDIDO.num_pedido) AS total_pedidos
FROM 
    PRODUTO
JOIN 
    ITEM_PEDIDO ON PRODUTO.cod_produto = ITEM_PEDIDO.cod_produto
GROUP BY 
    PRODUTO.nome
HAVING 
    COUNT(ITEM_PEDIDO.num_pedido) = (
        SELECT MAX(total_pedidos)
        FROM (
            SELECT COUNT(ITEM_PEDIDO.num_pedido) AS total_pedidos
            FROM ITEM_PEDIDO
            GROUP BY ITEM_PEDIDO.cod_produto
        )
    );


---D)---
SELECT 
    CLIENTE.nome AS cliente,
    PEDIDO.num_pedido,
    SUM(ITEM_PEDIDO.quantidade * ITEM_PEDIDO.valor_unitario) AS valor_total
FROM 
    CLIENTE
JOIN 
    PEDIDO ON CLIENTE.cod_cliente = PEDIDO.cod_cliente
JOIN 
    ITEM_PEDIDO ON PEDIDO.num_pedido = ITEM_PEDIDO.num_pedido
GROUP BY 
    CLIENTE.nome, PEDIDO.num_pedido
ORDER BY 
    valor_total DESC;

---E)--
SELECT * FROM (
SELECT 
    CATEGORIA.nome AS categoria,
    COUNT(ITEM_PEDIDO.num_pedido) AS total_vendas
FROM 
    CATEGORIA
JOIN 
    PRODUTO ON CATEGORIA.cod_categoria = PRODUTO.cod_categoria
JOIN 
    ITEM_PEDIDO ON PRODUTO.cod_produto = ITEM_PEDIDO.cod_produto
GROUP BY 
    CATEGORIA.nome
ORDER BY 
    total_vendas DESC )
where ROWNUM <=3;