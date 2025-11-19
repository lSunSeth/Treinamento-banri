-- Resposta Exercício 2: consulta com Função Agregada e Ordenação
SELECT T.TIPO, AVG(R.VALOR) AS MediaMovimentacao
FROM PXC.REGISTRO R
INNER JOIN PXC.TIPO_REGISTRO T ON R.ID_TIPO = T.ID
GROUP BY T.TIPO
ORDER BY MediaMovimentacao DESC;
