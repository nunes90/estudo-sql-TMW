-- 6. Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?
-- Quando chagamos em 3000 clientes?
WITH
    tb_dia_cliente AS (
        SELECT
            substr (DtCriacao, 1, 10) AS dtDia,
            COUNT(DISTINCT IdCliente) AS qtdeClientes
        FROM
            clientes
        GROUP BY
            dtDia
    ),
    tb_acum AS (
        SELECT
            *,
            SUM(qtdeClientes) OVER (
                ORDER BY
                    dtDia
            ) AS qtdClienteAcum
        FROM
            tb_dia_cliente
    )
SELECT
    *
FROM
    tb_acum
WHERE
    qtdClienteAcum >= 3000
ORDER BY
    dtDia
LIMIT
    1;