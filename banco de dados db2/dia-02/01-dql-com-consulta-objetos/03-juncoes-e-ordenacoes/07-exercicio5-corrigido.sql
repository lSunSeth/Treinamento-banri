-- Resposta Exercício 5: junção Equivalente (Sintaxe Implícita)
SELECT E.NUMERO_CONTA, R.VALOR
FROM PXC.EXTRATO E, PXC.REGISTRO R
WHERE E.ID = R.ID_EXTRATO;