-- 7. Qual o produto mais transacionado?
SELECT
    *
FROM
    transacao_produto
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    IdProduto AS Produto,
    COUNT(DISTINCT IdTransacao) AS QtdeTransacoes
FROM
    transacao_produto
GROUP BY
    IdProduto
ORDER BY
    QtdeTransacoes DESC
LIMIT
    1;