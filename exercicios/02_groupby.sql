-- 2. Qual cliente juntou mais pontos positivos em 2025-05?
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    idCliente,
    SUM(qtdePontos) AS totalPontos
FROM
    transacoes
WHERE
    dtCriacao >= '2025-05-01'
    AND dtCriacao < '2025-06-01'
    AND qtdePontos > 0
GROUP BY
    idCliente
ORDER BY
    totalPontos DESC
LIMIT
    1;
