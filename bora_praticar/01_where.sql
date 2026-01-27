-- Selecione todos os clientes com email cadastrado
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
    clientes
WHERE
    flEmail = 1;

-- WHERE flEmail != 0;
-- WHERE flEmail <> 0;
