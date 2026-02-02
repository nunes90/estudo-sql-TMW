-- Limpa a tabela, mas mantem a estrutura, nao tem no SQLite
-- TRUNCATE TABLE relatorio_diario;

.schema relatorio_diario;

DELETE FROM relatorio_diario;

SELECT
    *
FROM
    relatorio_diario;
