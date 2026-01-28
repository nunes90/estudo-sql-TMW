-- 2. Quais clientes assinaram a lista de presença no dia 2025/08/25?
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
SELECT DISTINCT
    t.IdCliente
FROM
    transacoes AS t
    LEFT JOIN transacao_produto AS tp ON t.IdTransacao = tp.IdTransacao
    LEFT JOIN produtos AS p ON tp.IdProduto = p.IdProduto
WHERE
    substr (t.DtCriacao, 1, 10) = '2025-08-25'
    AND p.DescNomeProduto = 'Lista de presença'
GROUP BY
    t.IdCliente;