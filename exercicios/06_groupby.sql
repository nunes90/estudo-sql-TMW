-- 6. Qual dia da semana que tem mais pedidos em 2025?
SELECT
    strftime ('%w', datetime (substr (DtCriacao, 1, 10))) AS DiaSemana,
    count(DISTINCT IdTransacao) AS QtdePedidos
FROM
    transacoes
WHERE
    DtCriacao >= '2025-01-01'
    AND DtCriacao < '2026-01-01'
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1