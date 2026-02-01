-- 13. Qual o dia com maior engajamento (mais transações) de cada aluno que iniciou o curso no dia 01?
WITH
    -- Quem iniciou o curso no primeiro dia
    tb_alunos_dia01 AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-25'
    ),
    tb_dia_cliente AS (
        SELECT
            tpd.IdCliente,
            substr (t.DtCriacao, 1, 10) AS dtDia,
            COUNT(*) AS qtdInteracoes
        FROM
            tb_alunos_dia01 AS tpd
            LEFT JOIN transacoes AS t ON tpd.IdCliente = t.IdCliente
            AND substr (t.DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-30'
        GROUP BY
            tpd.IdCliente,
            substr (t.DtCriacao, 1, 10)
        ORDER BY
            tpd.IdCliente,
            dtDia
    ),
    tb_rn AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtdInteracoes DESC,
                    dtDia DESC
            ) AS rn
        FROM
            tb_dia_cliente
    )
SELECT
    *
FROM
    tb_rn
WHERE
    rn = 1
