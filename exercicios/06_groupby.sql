-- 6. Qual dia da semana que tem mais pedidos em 2025?
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
-- 0 - Domingo 6 - Sábado 5 - Sexta 4 - Quarta 3 - Terca 2 - Segunda 1 
SELECT
    strftime ('%w', datetime (substr (DtCriacao, 1, 10))) AS WeekDay,
    COUNT(DISTINCT IdTransacao) AS QtdeTransacoes
FROM
    transacoes
WHERE
    -- strftime ('%Y', datetime (substr (DtCriacao, 1, 19))) = '2025'
    substr (DtCriacao, 1, 4) = '2025'
    -- DtCriacao >= '2025-01-01'
    -- AND DtCriacao < '2026-01-01'
GROUP BY
    WeekDay
ORDER BY
    QtdeTransacoes DESC
LIMIT
    1;
