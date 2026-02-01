-- 8. Saldo de pontos acumulado de cada usuário
WITH
    tb_cliente_dia AS (
        SELECT
            IdCliente,
            substr (DtCriacao, 1, 10) AS dtDia,
            SUM(QtdePontos) AS totalPontos,
            SUM(
                CASE
                    WHEN QtdePontos > 0 THEN QtdePontos
                    ELSE 0
                END
            ) AS pontosPositivos
        FROM
            transacoes
        GROUP BY
            IdCliente,
            dtDia
    )
SELECT
    *,
    SUM(totalPontos) OVER (
        PARTITION BY
            IdCliente
        ORDER BY
            dtDia
    ) AS saldoPontos,
    SUM(pontosPositivos) OVER (
        PARTITION BY
            IdCliente
        ORDER BY
            dtDia
    ) AS saldoPontosPositivos
FROM
    tb_cliente_dia