-- Clientes que transacionaram em julho de 2025
SELECT count(*) AS QtdeTransacoes, count(DISTINCT IdCliente) AS QtdeClientes

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

ORDER BY DtCriacao DESC