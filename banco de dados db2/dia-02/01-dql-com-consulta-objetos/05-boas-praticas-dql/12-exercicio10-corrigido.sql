-- ## Exercício 11: Evite Subconsultas Desnecessárias
-- Solução: Reescreve a consulta usando INNER JOIN (Junção).
-- Consulta Reescrita:
SELECT E.*
FROM EXTRATO E
INNER JOIN REGISTRO R
    ON E.ID = R.ID_EXTRATO
WHERE
    R.VALOR > 1000;