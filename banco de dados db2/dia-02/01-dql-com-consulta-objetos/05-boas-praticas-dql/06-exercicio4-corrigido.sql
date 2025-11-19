-- ## Exercício 4: Evite Funções em Colunas da Cláusula WHERE
-- Solução: Filtra o ano usando BETWEEN nas datas (assumindo que REGISTRO tem uma coluna de data, aqui chamada DATA_MOVIMENTACAO).
-- Se a tabela REGISTRO não tiver uma coluna de data, o exercício não é executável.
-- A prática é usar operadores de faixa (>, <, BETWEEN) no campo da coluna, sem envolver a coluna em uma função.
SELECT *
FROM REGISTRO
WHERE DATA_MOVIMENTACAO BETWEEN '2023-01-01' AND '2023-12-31';
