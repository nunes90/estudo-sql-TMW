-- 3. Qual cliente fez mais transacoes no ano de 2024?
SELECT
    IdCliente AS Cliente,
    count(DISTINCT IdTransacao) AS QtdeTransacoes
FROM
    transacoes
WHERE
    DtCriacao >= '2024-01-01'
    AND DtCriacao < '2025-01-01'
    -- WHERE strftime('%Y', datetime(substr(DtCriacao, 1, 19))) = '2024'
    -- WHERE substr(DtCriacao, 1, 4) = '2024'
GROUP BY
    IdCliente
ORDER BY
    count(IdTransacao) DESC
LIMIT
    1