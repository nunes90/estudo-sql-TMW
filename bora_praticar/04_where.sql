-- Selecione produtos que contêm ‘churn’ no nome
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
    DescNomeProduto LIKE '%churn%';

-- OR, IN, LIKE
-- WHERE DescNomeProduto IN ('%churn%'); 
-- WHERE DescNomeProduto LIKE '%\_%'; <- pelo underline
-- Forma ideal seria buscar pela categoria do produto
-- Entender como o banco esta organizado
-- E a comparação menos custosa
-- WHERE DescCategoriaProduto = 'churn_model'