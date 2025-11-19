-- ## Exercício 9: Teste e Otimize Consultas com EXPLAIN
-- Solução: Envolve a consulta original com a palavra-chave EXPLAIN (ou EXPLAIN ANALYZE).
EXPLAIN
SELECT
    E.NOME_TITULAR,
    R.VALOR
FROM
    EXTRATO E
INNER JOIN
    REGISTRO R ON E.ID = R.ID_EXTRATO
WHERE
    R.VALOR > 1000 AND E.NOME_TITULAR LIKE 'A%';
