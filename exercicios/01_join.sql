-- 1. Quais clientes mais perderam pontos por Lover?
SELECT
    *
FROM
    clientes
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
    t.IdCliente,
    SUM(t.QtdePontos) AS TotalPontosPerdidos
    -- p.DescNomeProduto,
    -- p.DescCategoriaProduto
FROM
    transacoes AS t
    LEFT JOIN transacao_produto AS tp ON t.IdTransacao = tp.IdTransacao
    LEFT JOIN produtos AS p ON tp.IdProduto = p.IdProduto
WHERE
    p.DescCategoriaProduto = 'lovers'
GROUP BY
    t.IdCliente
ORDER BY
    TotalPontosPerdidos ASC
LIMIT
    5;