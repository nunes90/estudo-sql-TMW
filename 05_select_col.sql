SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    IdCliente,
    -- QtdePontos,
    -- QtdePontos + 10 AS QtdePontosPlus10,
    -- QtdePontos * 2 AS QtdePontosDouble
    DtCriacao,
    -- Seleciona uma substring
    substr (DtCriacao, 1, 19) AS dtSubString,
    -- Converte para datetime
    datetime (substr (DtCriacao, 1, 19)) As dtCriacaoNova,
    -- Converte para dia da semana, strftime = string format
    -- %w = dia da semana, 0 = domingo
    strftime ('%w', datetime (substr (DtCriacao, 1, 19))) As diaSemana
FROM
    clientes;

-- Functions of SQLite
-- https://sqlite.org/lang_corefunc.html
-- https://sqlite.org/lang_datefunc.html