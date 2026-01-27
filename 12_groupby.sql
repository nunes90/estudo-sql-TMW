SELECT
    IdProduto,
    COUNT(*)
FROM
    transacao_produto
GROUP BY
    IdProduto
LIMIT
    10;

-------------------------------------------------------------------------------
-- Qual o cliente que mais juntou pontos no mes de julho de 2025?
SELECT
    IdCliente,
    SUM(QtdePontos),
    COUNT(IdTransacao)
FROM
    transacoes
WHERE
    DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01' -- JULHO de 2025
GROUP BY
    IdCliente
HAVING
    SUM(QtdePontos) >= 4000
ORDER BY
    SUM(QtdePontos) DESC
LIMIT
    10;
