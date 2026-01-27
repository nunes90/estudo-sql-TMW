-- Pontos ganhos em julho
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    SUM(QtdePontos),
    SUM(
        CASE
            WHEN QtdePontos > 0 THEN QtdePontos
        END
    ) AS QtdePontosPositivos,
    SUM(
        CASE
            WHEN QtdePontos < 0 THEN QtdePontos
        END
    ) AS QtdePontosNegativos,
    COUNT(
        CASE
            WHEN QtdePontos < 0 THEN QtdePontos
        END
    ) AS QtdeNegativos
FROM
    transacoes
WHERE
    DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01';