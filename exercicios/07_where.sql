-- 7. Lista de produtos que são “chapéu”;
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
    DescNomeProduto LIKE '%chapéu%';

-- Negando
-- WHERE DescNomeProduto NOT LIKE '%chapéu%';