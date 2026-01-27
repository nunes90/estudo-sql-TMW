-- 5. Qual o valor medio de pontos positivos por dia?
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    SUM(QtdePontos) AS TotalPontos,
    COUNT(substr (DtCriacao, 1, 10)) AS QtdeDias,
    COUNT(DISTINCT substr (DtCriacao, 1, 10)) AS QtdeDiasUnicos,
    SUM(QtdePontos) / COUNT(DISTINCT substr (DtCriacao, 1, 10)) AS MediaPontos
FROM
    transacoes
WHERE
    QtdePontos > 0;

-------------------------------------------------------------------------------
SELECT
    substr (DtCriacao, 1, 10) AS dtDia,
    AVG(QtdePontos) AS avgPontosDia
FROM
    transacoes
WHERE
    QtdePontos > 0
GROUP BY
    dtDia --1
ORDER BY
    avgPontosDia DESC;

-------------------------------------------------------------------------------
-- Por dia da semana
SELECT
    strftime ('%w', datetime (substr (DtCriacao, 1, 10))) AS DiaSemana,
    AVG(QtdePontos) AS MediaPontos,
    SUM(QtdePontos) AS TotalPontos
FROM
    transacoes
WHERE
    QtdePontos > 0
GROUP BY
    DiaSemana;
