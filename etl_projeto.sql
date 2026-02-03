-- ✔️ 1. Quantidade de transações históricas (vida, D7, D14, D28, D56); 
-- ✔️ 2. Dias desde a última transação;
-- ✔️ 3. Idade na base;
-- ✔️ 4. Produto mais usado (vida, D7, D14, D28, D56);
-- ✔️ 5. Saldo de pontos atual; 
-- ✔️ 6. Pontos acumulados positivos (vida, D7, D14, D28, D56);
-- ✔️ 7. Pontos acumulados negativos (vida, D7, D14, D28, D56);
-- ✔️ 8. Dias da semana mais ativos (D28)
-- ✔️ 9. Período do dia mais ativo (D28)
-- ✔️ 10. Engajamento em D28 versus Vida
-------------------------------------------------------------------------------
-- DROP TABLE IF EXISTS tb_feature_store_cliente;
-- CREATE TABLE tb_feature_store_cliente AS
WITH
    tb_transacoes AS (
        SELECT
            IdTransacao,
            IdCliente,
            QtdePontos,
            datetime (substr (DtCriacao, 1, 19)) as dtCriacao,
            julianday ('{date}') - julianday (substr (dtCriacao, 1, 10)) AS diffDate,
            CAST(strftime ('%H', dtCriacao) AS INTEGER) AS dtHora
        FROM
            transacoes
        WHERE
            dtCriacao < '{date}'
    ),
    tb_cliente AS (
        SELECT DISTINCT
            IdCliente,
            datetime (substr (DtCriacao, 1, 19)) AS dtCriacao,
            julianday ('{date}') - julianday (substr (dtCriacao, 1, 10)) AS idadeBase
        FROM
            clientes
    ),
    tb_sumario_transacoes AS (
        SELECT
            IdCliente,
            COUNT(IdTransacao) AS qtdeTransacoesVida,
            COUNT(
                CASE
                    WHEN diffDate <= 56 THEN IdTransacao
                END
            ) AS QtdeTransacoesD56,
            COUNT(
                CASE
                    WHEN diffDate <= 28 THEN IdTransacao
                END
            ) AS QtdeTransacoesD28,
            COUNT(
                CASE
                    WHEN diffDate <= 14 THEN IdTransacao
                END
            ) AS QtdeTransacoesD14,
            COUNT(
                CASE
                    WHEN diffDate <= 07 THEN IdTransacao
                END
            ) AS QtdeTransacoesD7,
            MIN(diffDate) AS diasUltimaTransacao,
            SUM(QtdePontos) AS saldoPontos,
            SUM(
                CASE
                    WHEN QtdePontos > 0 THEN QtdePontos
                    ELSE 0
                END
            ) AS qtdePontosPosVida,
            SUM(
                CASE
                    WHEN qtdePontos > 0
                    AND diffDate <= 56 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosPos56,
            SUM(
                CASE
                    WHEN qtdePontos > 0
                    AND diffDate <= 28 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosPos28,
            SUM(
                CASE
                    WHEN qtdePontos > 0
                    AND diffDate <= 14 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosPos14,
            SUM(
                CASE
                    WHEN qtdePontos > 0
                    AND diffDate <= 7 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosPos7,
            SUM(
                CASE
                    WHEN QtdePontos < 0 THEN QtdePontos
                    ELSE 0
                END
            ) AS qtdePontosNegVida,
            SUM(
                CASE
                    WHEN qtdePontos < 0
                    AND diffDate <= 56 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosNeg56,
            SUM(
                CASE
                    WHEN qtdePontos < 0
                    AND diffDate <= 28 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosNeg28,
            SUM(
                CASE
                    WHEN qtdePontos < 0
                    AND diffDate <= 14 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosNeg14,
            SUM(
                CASE
                    WHEN qtdePontos < 0
                    AND diffDate <= 7 THEN qtdePontos
                    ELSE 0
                END
            ) AS qtdePontosNeg7
        FROM
            tb_transacoes
        GROUP BY
            IdCliente
    ),
    tb_transacao_produto AS (
        SELECT
            t1.*,
            t3.DescNomeProduto,
            t3.DescCategoriaProduto
        FROM
            tb_transacoes AS t1
            LEFT JOIN transacao_produto AS t2 ON t1.IdTransacao = t2.IdTransacao
            LEFT JOIN produtos AS t3 ON t2.IdProduto = t3.IdProduto
    ),
    tb_cliente_produto AS (
        SELECT
            IdCliente,
            DescNomeProduto,
            COUNT(*) AS qtdeVida,
            COUNT(
                CASE
                    WHEN diffDate <= 56 THEN IdTransacao
                END
            ) AS qtde56,
            COUNT(
                CASE
                    WHEN diffDate <= 28 THEN IdTransacao
                END
            ) AS qtde28,
            COUNT(
                CASE
                    WHEN diffDate <= 14 THEN IdTransacao
                END
            ) AS qtde14,
            COUNT(
                CASE
                    WHEN diffDate <= 7 THEN IdTransacao
                END
            ) AS qtde7
        FROM
            tb_transacao_produto
        GROUP BY
            IdCliente,
            DescNomeProduto
    ),
    tb_cliente_produto_rn AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtdeVida DESC
            ) AS rnVida,
            -- For qtde56
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtde56 DESC
            ) AS rn56,
            -- For qtde28
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtde28 DESC
            ) AS rn28,
            -- For qtde14
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtde14 DESC
            ) AS rn14,
            -- For qtde7
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtde7 DESC
            ) AS rn7
        FROM
            tb_cliente_produto
    ),
    tb_cliente_dia AS (
        SELECT
            IdCliente,
            strftime ('%w', DtCriacao) AS dtDia,
            COUNT(*) AS qtdeTransacao
        FROM
            tb_transacoes
        WHERE
            diffDate <= 28
        GROUP BY
            IdCliente,
            dtDia
    ),
    tb_cliente_dia_rn AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtdeTransacao DESC
            ) AS rnDia
        FROM
            tb_cliente_dia
    ),
    tb_cliente_periodo AS (
        SELECT
            IdCliente,
            CASE
                WHEN dtHora BETWEEN 7 AND 12  THEN 'MANHA'
                WHEN dtHora BETWEEN 13 AND 18  THEN 'TARDE'
                WHEN dtHora BETWEEN 19 AND 23  THEN 'NOITE'
                ELSE 'MADRUGADA'
            END AS periodo,
            COUNT(*) AS qtdeTransacao
        FROM
            tb_transacoes
        WHERE
            diffDate <= 28
        GROUP BY
            1,
            2
    ),
    tb_cliente_periodo_rn AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    IdCliente
                ORDER BY
                    qtdeTransacao DESC
            ) AS rnPeriodo
        FROM
            tb_cliente_periodo
    ),
    tb_join AS (
        SELECT
            t1.*,
            t2.idadeBase,
            -- t3.DescNomeProduto AS produtoVida,
            COALESCE(t3.DescNomeProduto, 'SEM PRODUTO') AS produtoVida,
            t4.DescNomeProduto AS produto56,
            t5.DescNomeProduto AS produto28,
            t6.DescNomeProduto AS produto14,
            t7.DescNomeProduto AS produto7,
            -- Pega o primeiro nao nulo
            COALESCE(t8.dtDia, -1) AS dtDia28,
            COALESCE(t9.periodo, 'SEM INFORMACAO') AS periodo28
        FROM
            tb_sumario_transacoes AS t1
            LEFT JOIN tb_cliente AS t2 ON t1.IdCliente = t2.IdCliente
            LEFT JOIN tb_cliente_produto_rn AS t3 ON t1.IdCliente = t3.IdCliente
            AND t3.rnVida = 1
            LEFT JOIN tb_cliente_produto_rn AS t4 ON t1.IdCliente = t4.IdCliente
            AND t4.rn56 = 1
            LEFT JOIN tb_cliente_produto_rn AS t5 ON t1.IdCliente = t5.IdCliente
            AND t5.rn28 = 1
            LEFT JOIN tb_cliente_produto_rn AS t6 ON t1.IdCliente = t6.IdCliente
            AND t6.rn14 = 1
            LEFT JOIN tb_cliente_produto_rn AS t7 ON t1.IdCliente = t7.IdCliente
            AND t7.rn7 = 1
            LEFT JOIN tb_cliente_dia_rn AS t8 ON t1.IdCliente = t8.IdCliente
            AND t8.rnDia = 1
            LEFT JOIN tb_cliente_periodo_rn AS t9 ON t1.IdCliente = t9.IdCliente
            AND t9.rnPeriodo = 1
    )
    -- INSERT INTO
    -- tb_feature_store_cliente
SELECT
    '{date}' AS dtRef,
    *,
    -- Quanto pct das transacoes feitas nos ultimas 28 dias,
    -- correspondem ao todo de transacoes feitas pelo cliente
    -- 1. * QtdeTransacoesD28 / qtdeTransacoesVida AS engajamento28Vida
    CASE
        WHEN qtdeTransacoesVida > 0 THEN 1.0 * QtdeTransacoesD28 / qtdeTransacoesVida
        ELSE 0
    END AS engajamento28Vida
FROM
    tb_join;

-- SELECT
--     *
-- FROM
--     tb_feature_store_cliente
-- ORDER BY
--     IdCliente,
--     dtRef;