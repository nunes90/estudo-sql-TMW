-- 9. Dos clientes que começaram SQL no primeiro dia, quantos chegaram ao 5o dia?
WITH
    tb_cliente_primeiro_dia AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-25'
    ),
    tb_cliente_ultimo_dia AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-29'
    ),
    tb_join AS (
        SELECT
            cpd.IdCliente AS IdClientePrimeiroDia,
            cud.IdCliente AS IdClienteUltimoDia
        FROM
            tb_cliente_primeiro_dia AS cpd
            LEFT JOIN tb_cliente_ultimo_dia AS cud ON cpd.IdCliente = cud.IdCliente
    )
SELECT
    COUNT(IdClientePrimeiroDia) AS TotalPrimeiroDia,
    COUNT(IdClienteUltimoDia) AS TotalUltimoDia,
    COUNT(IdClienteUltimoDia) * 100.0 / COUNT(IdClientePrimeiroDia) AS PercentualChegaramNoQuintoDia
FROM
    tb_join;