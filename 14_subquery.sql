-- Lista de transacoes com o produto "Resgatar Ponei"
SELECT
    *
FROM
    transacao_produto AS tp
WHERE
    tp.IdProduto IN (
        SELECT
            IdProduto
        FROM
            produtos
        WHERE
            DescNomeProduto = 'Resgatar Ponei'
    );
