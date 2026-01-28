-- 3. Do início ao ﬁm do nosso curso (2025/08/25 a 2025/08/29), quantos clientes assinaram a lista de presença?
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
    COUNT(DISTINCT t.IdCliente) AS TotalClientes
FROM
    transacoes AS t
    LEFT JOIN transacao_produto AS tp ON t.IdTransacao = tp.IdTransacao
    LEFT JOIN produtos AS p ON tp.IdProduto = p.IdProduto
WHERE
    t.DtCriacao >= '2025-08-25'
    AND t.DtCriacao <= '2025-08-29'
    AND p.DescNomeProduto = 'Lista de presença';