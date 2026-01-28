-- 4. Clientes mais antigos, tem mais frequência de transação?
SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacao_produto
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    c.idCliente,
    julianday ('now') - julianday (substr (c.DtCriacao, 1, 19)) AS DiasComoCliente,
    COUNT(t.IdTransacao) AS TotalTransacoes
FROM
    clientes AS c
    LEFT JOIN transacoes AS t ON c.idCliente = t.IdCliente
GROUP BY
    c.idCliente,
    DiasComoCliente
ORDER BY
    DiasComoCliente DESC;