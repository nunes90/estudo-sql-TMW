-- Qual a categoria de produtos mais vendidos?
SELECT
    *
FROM
    produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacao_produto
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    COUNT(DISTINCT t1.IdTransacao) AS QtdeTransacoes,
    t2.DescCategoriaProduto AS Categoria
FROM
    transacao_produto AS t1
    LEFT JOIN produtos AS t2 ON t1.IdProduto = t2.IdProduto
GROUP BY
    t2.DescCategoriaProduto
ORDER BY
    QtdeTransacoes DESC
LIMIT
    1;