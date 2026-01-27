-- 1. Lista de transações com apenas 1 ponto
SELECT
    *
from
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    IdTransacao,
    QtdePontos
FROM
    transacoes
WHERE
    QtdePontos = 1;
