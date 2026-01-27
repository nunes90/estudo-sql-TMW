-- 2. Lista de pedidos realizados no ﬁm de semana;
SELECT
    *
from
    transacoes
LIMIT
    10;

-------------------------------------------------------------------------------
SELECT
    idTransacao,
    DtCriacao,
    strftime ('%w', datetime (substr (DtCriacao, 1, 19))) AS WeekDay
FROM
    transacoes
WHERE
    -- Nem todos aceitam ALIAS no WHERE
    -- 0 = Domingo, 6 = Sábado
    -- ta em texto
    WeekDay in ('0', '6');
