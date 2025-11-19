-- ## Exercício 6: Use Alias para Tabelas e Colunas
-- Solução: Usa aliases 'E' e 'R' para as tabelas e aliases descritivos para as colunas.
SELECT
    E.NOME_TITULAR AS Titular,
    R.VALOR AS Valor_Movimentacao
FROM
    EXTRATO E
INNER JOIN
    REGISTRO R ON E.ID = R.ID_EXTRATO;