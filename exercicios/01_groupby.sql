-- 1. Quantos clientes tem email cadastrado?
SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    SUM(flEmail) AS QtdeEmail
FROM
    clientes;