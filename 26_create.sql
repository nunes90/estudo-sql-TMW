-- .table
-- .schema relatorio_diario
DROP TABLE IF EXISTS clientes_d60;

CREATE TABLE clientes_d60 (
    IdCliente VARCHAR(250) PRIMARY KEY,
    qtdeTransacoes INTEGER
);

-------------------------------------------------------------------------------
DELETE FROM clientes_d60;

INSERT INTO
    clientes_d60
SELECT
    IdCliente,
    COUNT(DISTINCT IdTransacao) AS qtdeTransacoes
FROM
    transacoes
WHERE
    julianday ('now') - julianday (substr (DtCriacao, 1, 10)) <= 60
GROUP BY
    IdCliente;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    clientes_d60;