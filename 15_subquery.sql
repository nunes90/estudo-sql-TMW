-- 9. Dos clientes que começaram SQL no primeiro dia, quantos chegaram ao 5o dia?
SELECT
    COUNT(DISTINCT t.IdCliente) AS QtdClientes
FROM
    transacoes AS t
WHERE
    t.IdCliente IN (
        SELECT DISTINCT
            t.IdCliente
        FROM
            transacoes AS t
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-25'
    )
    AND substr (t.DtCriacao, 1, 10) = '2025-08-29';