-- 4. Quantos produtos sao de rpg?
SELECT
    count(*) AS QtdeRPG
FROM
    produtos
WHERE
    descCategoriaProduto = 'rpg';

SELECT
    descCategoriaProduto AS Categoria,
    count(*) AS QtdeRPG
FROM
    produtos
GROUP BY
    descCategoriaProduto
ORDER BY
    QtdeRPG DESC;