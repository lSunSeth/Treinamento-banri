-- ## Exercício 8: Limite Resultados com LIMIT ou TOP
-- Solução (Usando LIMIT, comum em MySQL/PostgreSQL/SQLite):
SELECT *
FROM REGISTRO
WHERE VALOR > 500
ORDER BY VALOR DESC -- Ordenar é importante para garantir que os 'top' resultados sejam relevantes
LIMIT 5;

-- Solução alternativa (Usando TOP, comum em SQL Server):
-- SELECT TOP 5 * FROM REGISTRO WHERE VALOR > 500 ORDER BY VALOR DESC;