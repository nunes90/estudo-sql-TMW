-- De quanto em quanto tempo as pessoas voltam (recorrencia) ?
WITH
    tb_cliente_dia AS (
        SELECT DISTINCT
            IdCliente,
            substr (DtCriacao, 1, 10) AS dtDia
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 4) = '2025'
        ORDER BY
            IdCliente,
            dtDia
    ),
    tb_lab AS (
        SELECT
            *,
            LAG (dtDia) OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    dtDia
            ) AS dtDiaAnterior
        FROM
            tb_cliente_dia
    ),
    tb_diff_dia AS (
        SELECT
            *,
            julianday (dtDia) - julianday (dtDiaAnterior) AS qtdeDias
        FROM
            tb_lab
    ),
    tb_avg_cliente AS (
        SELECT
            IdCliente,
            AVG(qtdeDias) AS avgdia
        FROM
            tb_diff_dia
        GROUP BY
            IdCliente
    )
SELECT
    AVG(avgdia)
FROM
    tb_avg_cliente