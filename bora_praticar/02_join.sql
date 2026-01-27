-- Em 2024, quantas transações de Lovers tivemos?
-- Exemplo extendido
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
    t3.DescCategoriaProduto AS Categoria,
    COUNT(DISTINCT t1.IdTransacao) AS QtdeTransacoes
FROM
    transacoes AS t1
    LEFT JOIN transacao_produto AS t2 ON t1.IdTransacao = t2.IdTransacao
    LEFT JOIN produtos AS t3 ON t2.IdProduto = t3.IdProduto
WHERE
    substr (t1.dtCriacao, 1, 4) = '2024'
    -- AND t3.DescCategoriaProduto = 'lovers'
GROUP BY
    t3.DescCategoriaProduto
HAVING
    t3.DescCategoriaProduto = 'lovers';