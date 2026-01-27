-- Selecione todas transações de 50 pontos (exatos)
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
    transacoes
WHERE
    QtdePontos = 50
LIMIT
    10;