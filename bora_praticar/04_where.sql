-- Selecione produtos que contêm ‘churn’ no nome
SELECT * 
FROM produtos
WHERE DescNomeProduto LIKE '%churn%'; -- Custoso, tenta IN

-- WHERE DescNomeProduto LIKE '%\_%'; 

-- OR, IN, LIKE
-- LIMIT 10;

-- Forma ideal seria buscar pela categoria do produto
-- Entender como o banco esta organizado
-- E a comparação menos custosa

-- WHERE DescCategoriaProduto = 'churn_model'