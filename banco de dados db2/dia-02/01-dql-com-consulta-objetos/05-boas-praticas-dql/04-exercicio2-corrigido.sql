-- ## Exercício 2: Selecione Apenas as Colunas Necessárias
-- Solução: Seleciona apenas NUMERO_CONTA (da tabela EXTRATO) e VALOR (da tabela REGISTRO) e filtra.
SELECT
    E.NUMERO_CONTA,
    R.VALOR
FROM
    EXTRATO E
INNER JOIN
    REGISTRO R ON E.ID = R.ID_EXTRATO
WHERE
    R.VALOR > 1000;