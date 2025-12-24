-- 2. Lista de pedidos realizados no ﬁm de semana;
SELECT idTransacao, DtCriacao,
strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS WeekDay
FROM transacoes

-- Nem todos aceitam ALIAS no WHERE
WHERE WeekDay in ('0', '6')