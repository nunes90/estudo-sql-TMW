-- 3. Qual cliente fez mais transacoes no ano de 2024?
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    idCliente,
    COUNT(DISTINCT IdTransacao) AS QtdeTransacoes
FROM
    transacoes
WHERE
    dtCriacao >= '2024-01-01'
    AND dtCriacao < '2025-01-01'
    -- strftime ('%Y', substr (dtCriacao, 1, 19)) = '2024'
GROUP BY
    idCliente
ORDER BY
    QtdeTransacoes DESC
LIMIT
    1;