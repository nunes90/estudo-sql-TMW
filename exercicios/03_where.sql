-- 3. Lista de clientes com 0 (zero) pontos;
SELECT
    *
FROM
    clientes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    idCliente,
    qtdePontos
FROM
    clientes
WHERE
    qtdePontos = 0;