-- 5. Lista de produtos com nome que começa com “Venda de”;
SELECT
    *
FROM
    produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    *
FROM
    produtos
WHERE
    DescNomeProduto LIKE 'Venda de%';