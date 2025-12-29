-- 1. Quantos clientes tem email cadastrado?
SELECT
    sum(flEmail) AS QtdeEmail
FROM
    clientes