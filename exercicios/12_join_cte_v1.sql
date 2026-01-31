-- 12. Dentre os clientes de janeiro/2025, quantos assistiram o curso de SQL?
WITH
    tb_clientes_janeiro AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 7) = '2025-01'
    )
SELECT
    -- *
    COUNT(DISTINCT tbcj.IdCliente) AS qtdClientesJaneiro,
    COUNT(DISTINCT tbt.IdCliente) AS qtdClientesQueAssistiramSQL
FROM
    tb_clientes_janeiro AS tbcj
    LEFT JOIN transacoes AS tbt ON tbcj.IdCliente = tbt.IdCliente
    AND tbt.DtCriacao BETWEEN '2025-08-25' AND '2025-08-30';

/*
A condição no ON diz: "ao fazer o join, só considere matches que atendam isso". Já o WHERE diz: "do resultado final, elimine o que não atender isso".    
*/