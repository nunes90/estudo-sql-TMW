-- Subquery FROM
SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            transacoes AS t
        WHERE
            t.DtCriacao >= '2025-01-01'
    ) AS subquery
WHERE
    DtCriacao < '2025-07-01';