-- 5. Quantidade de transações Acumuladas ao longo do tempo (diario)?
-- Quando atingimos 100.000 transações acumuladas ?
--------------------------------------------------------------------------------
-- Apaga a tabela relatorio_diario
DROP TABLE IF EXISTS relatorio_diario;

-- Cria a tabela relatorio_diario
CREATE TABLE IF NOT EXISTS relatorio_diario AS
WITH
    tb_diario AS (
        SELECT
            substr (DtCriacao, 1, 10) AS dtDia,
            COUNT(DISTINCT IdTransacao) AS qtdeTransacoes
        FROM
            transacoes
        GROUP BY
            dtDia
        ORDER BY
            dtDia
    ),
    tb_acumulado AS (
        SELECT
            *,
            SUM(qtdeTransacoes) OVER (
                PARTITION BY
                    1 -- Todas as linhas
                ORDER BY
                    dtDia
            ) AS qtdeTransacoesAcumuladas
        FROM
            tb_diario
    )
SELECT
    *
FROM
    tb_acumulado
WHERE
    qtdeTransacoesAcumuladas > 100000
ORDER BY
    qtdeTransacoesAcumuladas DESC
LIMIT
    1;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    relatorio_diario;