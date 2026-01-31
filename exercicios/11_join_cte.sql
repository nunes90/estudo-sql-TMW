-- 11. Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?
WITH
    -- Quem participou no primeiro dia
    tb_primeiro_dia AS (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) = '2025-08-25'
    ),
    -- Dias que cada cliente participou no curso
    tb_dias_curso AS (
        SELECT DISTINCT
            IdCliente,
            substr (DtCriacao, 1, 10) AS presenteDia
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-29'
        ORDER BY
            IdCliente
    ),
    -- Quantidade de dias que cada cliente participou no curso
    tb_cliente_dias AS (
        SELECT
            tpd.IdCliente AS IdClientePrimeiroDia,
            COUNT(DISTINCT tdc.presenteDia) AS QuantidadeDiasNoCurso
        FROM
            tb_primeiro_dia AS tpd
            LEFT JOIN tb_dias_curso AS tdc ON tpd.IdCliente = tdc.IdCliente
        GROUP BY
            tpd.IdCliente
    )
    -- Cálculo da média de dias no curso
SELECT
    AVG(QuantidadeDiasNoCurso) AS MediaDiasNoCurso,
    MAX(QuantidadeDiasNoCurso) AS MaxDiasNoCurso,
    MIN(QuantidadeDiasNoCurso) AS MinDiasNoCurso
FROM
    tb_cliente_dias;