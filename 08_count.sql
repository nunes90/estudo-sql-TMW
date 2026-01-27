/*
Contagem de linhas: count(*)
Contagem de linhas distintas: count(distinct column)
Soma: sum(column)
Media: avg(column)
Maximo: max(column)
Minimo: min(column)
*/
-------------------------------------------------------------------------------
SELECT
    COUNT(*) -- Contagem de linhas
    --  COUNT(1) - Contagem de linhas
    -- COUNT(IdCliente) - Contagem de linhas, verificando se tem valores nulos
FROM
    clientes;

-------------------------------------------------------------------------------
-- Valores distintos em dada combinação
-- Exemplo: Quantos clientes distintos temos cadastrados
SELECT DISTINCT
    COUNT(DISTINCT IdCliente)
FROM
    clientes;