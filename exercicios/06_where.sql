-- 6. Lista de produtos com nome que termina com “Lover”;
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
    DescNomeProduto LIKE '%Lover';