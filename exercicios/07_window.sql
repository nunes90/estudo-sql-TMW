-- 7. Qual o dia da semana mais ativo de cada usuário?
WITH
    tb_cliente_semana AS (
        SELECT DISTINCT
            IdCliente,
            COUNT(DISTINCT IdTransacao) AS qtdeTransacao,
            strftime ('%w', substr (DtCriacao, 1, 10)) AS dtDiaSemana
        FROM
            transacoes
        GROUP BY
            IdCliente,
            dtDiaSemana
        ORDER BY
            IdCliente
    ),
    tb_rn AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtdeTransacao DESC
            ) AS rn
        FROM
            tb_cliente_semana
    )
SELECT
    *
FROM
    tb_rn
WHERE
    rn = 1