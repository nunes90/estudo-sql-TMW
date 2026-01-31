-- 10. Como foi a curva de Churn do Curso de SQL?
WITH
    tb_clientes_d1 AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-25'
    )
SELECT
    substr (t2.DtCriacao, 1, 10) AS dtDia,
    COUNT(DISTINCT t1.IdCliente) AS qtdClientes,
    -- Curva de retenção
    100. * COUNT(DISTINCT t1.IdCliente) / (
        SELECT
            COUNT(*)
        FROM
            tb_clientes_d1
    ) AS pctRetencao,
    -- Curva de churn
    1 - 1. * COUNT(DISTINCT t1.IdCliente) / (
        SELECT
            COUNT(*)
        FROM
            tb_clientes_d1
    ) AS pctChurn
FROM
    tb_clientes_d1 AS t1
    LEFT JOIN transacoes AS t2 ON t1.IdCliente = t2.IdCliente
WHERE
    -- BETWEEN 
    t2.DtCriacao BETWEEN '2025-08-25' AND '2025-08-30'
GROUP BY
    dtDia;