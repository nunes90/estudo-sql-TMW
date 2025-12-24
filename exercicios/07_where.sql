-- 7. Lista de produtos que são “chapéu”;
SELECT DescNomeProduto
FROM produtos
WHERE DescNomeProduto LIKE '%chapéu%';
-- Negando
-- WHERE DescNomeProduto NOT LIKE '%chapéu%';