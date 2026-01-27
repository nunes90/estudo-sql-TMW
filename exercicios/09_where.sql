-- 9. Listar todas as transações adicionando uma coluna nova sinalizando “baixo”, “médio” e “alto” para o valor dos pontos [<10 ; <500; >=500]
SELECT
    *
from
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    IdTransacao,
    QtdePontos,
    CASE
        WHEN QtdePontos < 10 THEN 'Baixo'
        WHEN QtdePontos < 500 THEN 'Médio'
        ELSE 'Alto'
    END AS Pontos
FROM
    transacoes
ORDER BY
    QtdePontos DESC;
