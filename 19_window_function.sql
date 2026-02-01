-- Cada pessoa transacionou por dia, depois acumulado
WITH
    tb_cliente_dia AS (
        SELECT
            IdCliente,
            substr (DtCriacao, 1, 10) AS dtDia,
            COUNT(DISTINCT IdTransacao) as qtdeTransacoes
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-30'
        GROUP BY
            IdCliente,
            dtDia
    ),
    tb_lab AS (
        SELECT
            *,
            SUM(qtdeTransacoes) OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    dtDia
            ) AS qtdeTransAcumuladas,
            -- LAG -> Anterior
            -- LEAD -> Próximo
            LAG (qtdeTransacoes) OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    dtDia
            ) AS qtdeTransAnterior
        FROM
            tb_cliente_dia
    )
SELECT
    *,
    1. * qtdeTransacoes / qtdeTransAnterior AS porcentagemEmRelacaoAoDiaAnterior
FROM
    tb_lab