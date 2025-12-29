-- 8. Qual o produto com pontos transacionados? 
SELECT
    IdProduto AS Produto,
    sum(VlProduto * QtdeProduto) AS Total
FROM
    transacao_produto
GROUP BY
    1
ORDER BY
    2 DESC