-- 4. Lista de clientes com 100 a 200 pontos (inclusive ambos);
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
    qtdePontos >= 100
    AND qtdePontos <= 200;

-- WHERE qtdePontos BETWEEN 100 AND 200;
-- >= AND <= -> BETWEEN