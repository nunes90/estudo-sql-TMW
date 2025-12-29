-- 5. Qual o valor medio de pontos positivos por dia?
SELECT
    sum(QtdePontos) AS TotalPontos,
    count(substr (DtCriacao, 1, 10)) AS QtdeDiasRepetidos,
    count(DISTINCT substr (DtCriacao, 1, 10)) AS QtdeDiasUnicos,
    sum(QtdePontos) / count(DISTINCT substr (DtCriacao, 1, 10)) AS MediaPontos
FROM
    transacoes
WHERE
    QtdePontos > 0;

SELECT
    substr (DtCriacao, 1, 10) AS DIA,
    avg(QtdePontos) AS avgPontosDia
FROM
    transacoes
WHERE
    QtdePontos > 0
GROUP BY
    1 -- Primeira coluna do select
ORDER BY
    1;