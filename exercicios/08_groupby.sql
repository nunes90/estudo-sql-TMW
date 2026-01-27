-- 8. Qual o produto com mais pontos transacionados?
SELECT
    *
FROM
    transacao_produto
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    IdProduto AS Produto,
    SUM(vlProduto * QtdeProduto) AS Total
FROM
    transacao_produto
GROUP BY
    IdProduto
ORDER BY
    Total DESC
LIMIT
    1;