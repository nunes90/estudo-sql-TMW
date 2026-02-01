WITH
    tb_sumario_dias AS (
        SELECT
            substr (DtCriacao, 1, 10) AS dtDia,
            COUNT(DISTINCT IdTransacao) AS qtdeTrans
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-30'
        GROUP BY
            dtDia
    )
SELECT
    *,
    SUM(qtdeTrans) OVER (
        ORDER BY
            dtDia
    ) AS qtdeTransAcumuladas
FROM
    tb_sumario_dias