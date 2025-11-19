-- ## Exercício 5: Use JOINs de Forma Eficiente
-- Solução: Usa INNER JOIN (ou JOIN) que é o padrão eficiente para buscar apenas registros correspondentes.
SELECT
    E.NOME_TITULAR,
    R.VALOR
FROM
    EXTRATO E
INNER JOIN
    REGISTRO R ON E.ID = R.ID_EXTRATO;