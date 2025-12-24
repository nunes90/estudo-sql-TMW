SELECT IdCliente, 
-- QtdePontos,
-- QtdePontos + 10 AS QtdePontosPlus10,
-- QtdePontos * 2 AS QtdePontosDouble
DtCriacao,
-- Seleciona uma substring
substr(DtCriacao, 1,19) AS dtSubString,
datetime(substr(DtCriacao,1,19)) As dtCriacaoNova,
strftime('%w', datetime(substr(DtCriacao,1,19))) As diaSemana
FROM clientes