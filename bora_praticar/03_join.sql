-- Qual mês tivemos mais lista de presença assinda?
SELECT
    *
FROM
    transacoes
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
    produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    strftime ('%m', t1.dtCriacao) AS Mes,
    COUNT(DISTINCT t1.IdTransacao) AS QtdeTransacoes
FROM
    transacoes AS t1
    LEFT JOIN transacao_produto AS t2 ON t1.IdTransacao = t2.IdTransacao
    LEFT JOIN produtos AS t3 ON t2.IdProduto = t3.IdProduto
WHERE
    t3.DescNomeProduto = 'Lista de presença'
GROUP BY
    Mes
ORDER BY
    QtdeTransacoes DESC
LIMIT
    1;