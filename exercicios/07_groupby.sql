-- 7. Qual o produto mais transacionado?
SELECT
    IdProduto AS Produto,
    count(IdTransacao) AS QtdeTransacoes
FROM
    transacao_produto
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1