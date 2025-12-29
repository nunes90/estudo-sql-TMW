-- Qual a categoria de produtos mais vendidos?
SELECT
    *
FROM
    transacao_produto
LIMIT
    5;

SELECT
    *
FROM
    produtos
LIMIT
    5;

SELECT
    descCategoriaProduto AS Categoria,
    count(transacao_produto.IdTransacao) AS QtdeTransacoes
FROM
    transacao_produto
    INNER JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
GROUP BY
    descCategoriaProduto
ORDER BY
    QtdeTransacoes DESC;