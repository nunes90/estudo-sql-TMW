-- Clientes que transacionaram em julho de 2025
-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    COUNT(*) AS QtdeTransacoes,
    COUNT(DISTINCT IdCliente) AS QtdeClientes
FROM
    transacoes
WHERE
    DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
ORDER BY
    DtCriacao DESC;