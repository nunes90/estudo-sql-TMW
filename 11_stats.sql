-- Media da carteira de pontos
SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    COUNT(*) AS QtdeClientes,
    -- AVG -> registros distintos / registros totais
    ROUND(AVG(QtdePontos), 2) AS MediaPontos,
    1. * SUM(QtdePontos) / COUNT(IdCliente) AS MediaPontos2,
    MIN(QtdePontos) AS MinPontos,
    MAX(QtdePontos) AS MaxPontos,
    SUM(flTwitch) AS QtdeTwitch, -- 1 ou 0
    SUM(flYoutube) AS QtdeYoutube, -- 1 ou 0
    SUM(flEmail) AS QtdeEmail -- 1 ou 0
FROM
    clientes
LIMIT
    10;