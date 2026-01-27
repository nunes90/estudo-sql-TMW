-- 8. Lista de transações com o produto “Resgatar Ponei”;
SELECT
    *
FROM
    -- transacoes
    transacao_produto
    -- produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    produtos
WHERE
    DescNomeProduto = 'Resgatar Ponei';

-------------------------------------------------------------------------------
SELECT
    *
FROM
    transacao_produto
WHERE
    IdProduto = 15;