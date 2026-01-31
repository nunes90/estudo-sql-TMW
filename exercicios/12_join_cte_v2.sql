-- 12. Dentre os clientes de janeiro/2025, quantos assistiram o curso de SQL?
-- Versão 2
WITH
    -- clientes janeiro
    tb_clientes_janeiro AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 7) = '2025-01'
    ),
    -- clientes que assistiram o curso
    tb_clientes_curso AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-30'
    )
SELECT
    COUNT(DISTINCT tbcj.IdCliente) AS qtdClientesJaneiro,
    COUNT(DISTINCT tbt.IdCliente) AS qtdClientesQueAssistiramSQL
FROM
    tb_clientes_janeiro AS tbcj
    LEFT JOIN tb_clientes_curso AS tbt ON tbcj.IdCliente = tbt.IdCliente
