-- Em 2024, quantas transações de Lovers tivemos?
-- Exemplo extendido
SELECT
    count(DISTINCT transacoes.IdTransacao) AS QtdeTransacoes,
    produtos.descCategoriaProduto AS Categoria
FROM
    transacoes
    LEFT JOIN transacao_produto ON transacoes.IdTransacao = transacao_produto.IdTransacao
    LEFT JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
WHERE
    DtCriacao >= '2024-01-01'
    AND DtCriacao < '2025-01-01'
    -- AND produtos.descCategoriaProduto = 'lovers'
GROUP BY
    produtos.descCategoriaProduto
HAVING
    count(DISTINCT transacoes.IdTransacao) < 1000
ORDER BY
    QtdeTransacoes DESC