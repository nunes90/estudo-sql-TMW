-- 4. Quantos produtos sao de rpg?
SELECT
    *
FROM
    produtos
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    COUNT(*) AS QtdeProdutos
FROM
    produtos
WHERE
    DescCategoriaProduto = 'rpg';

-------------------------------------------------------------------------------
SELECT
    DescCategoriaProduto,
    COUNT(*) AS QtdeProdutos
FROM
    produtos
GROUP BY
    DescCategoriaProduto
ORDER BY
    QtdeProdutos DESC;