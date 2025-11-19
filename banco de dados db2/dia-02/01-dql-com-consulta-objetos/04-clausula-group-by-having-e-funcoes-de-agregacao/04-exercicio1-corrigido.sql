-- Resposta Exercício 1: junção com Condições Múltiplas
SELECT
    E.NOME_TITULAR,
    T.TIPO,
    SUM(R.VALOR) AS VALOR_TOTAL_ACUMULADO
FROM
    PXC.EXTRATO E
INNER JOIN
    PXC.REGISTRO R ON E.ID = R.ID_EXTRATO
INNER JOIN
    PXC.TIPO_REGISTRO T ON R.ID_TIPO = T.ID
WHERE
    R.VALOR > 500 -- Filtra registros individuais > 500
GROUP BY
    E.NOME_TITULAR,
    T.TIPO -- Agrupa para somar
ORDER BY
    E.NOME_TITULAR;