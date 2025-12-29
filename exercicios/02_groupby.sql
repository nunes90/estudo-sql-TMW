-- 2. Qual cliente juntou mais pontos positivos em 2025-05?
SELECT
    IdCliente AS Cliente,
    sum(QtdePontos) AS QtdePontos
FROM
    transacoes
WHERE
    DtCriacao >= '2025-05-01'
    AND DtCriacao < '2025-06-01'
    AND QtdePontos > 0
GROUP BY
    IdCliente
ORDER BY
    QtdePontos DESC
LIMIT
    1