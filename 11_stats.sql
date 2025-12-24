SELECT count(*) AS QtdeClientes, round(avg(QtdePontos), 2) AS MediaPontos,
1. * sum(QtdePontos) / count(IdCliente) AS MediaPontos2,
min(QtdePontos) AS MinPontos, max(QtdePontos) AS MaxPontos,
sum(flTwitch) AS QtdeTwitch,
sum(flYoutube) AS QtdeYoutube,
sum(flEmail) AS QtdeEmail

FROM clientes
LIMIT 10