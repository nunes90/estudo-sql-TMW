-- Selecione todos clientes com mais de 500 pontos
SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    idCliente,
    QtdePontos
FROM
    clientes
WHERE
    QtdePontos > 500
LIMIT
    10;
