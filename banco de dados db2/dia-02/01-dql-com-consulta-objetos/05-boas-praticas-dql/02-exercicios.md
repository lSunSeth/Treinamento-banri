# Exercicíos e boas práticas

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO", então o comando
"SELECT * FROM EXTRATO" se torna "SELECT * FROM PXC.EXTRATO".**

## Exercício 1: Use Nomes Descritivos para Tabelas e Colunas

Enunciado: Crie uma consulta para retornar o número da conta e o nome do titular da conta na tabela EXTRATO.
Certifique-se de que os nomes das tabelas e colunas são descritivos.

## Exercício 2: Selecione Apenas as Colunas Necessárias

Enunciado: Escreva uma consulta que mostre apenas o número da conta e o valor das movimentações maiores que 1000 na tabela REGISTRO.

## Exercício 3: Utilize Filtragem Adequada com WHERE

Enunciado: Mostre todas as movimentações da tabela REGISTRO com valor superior a 2000.

## Exercício 4: Evite Funções em Colunas da Cláusula WHERE

Enunciado: Retorne todas as movimentações feitas em 2023 sem utilizar funções nas colunas da cláusula WHERE.

## Exercício 5: Use JOINs de Forma Eficiente

Enunciado: Escreva uma consulta para retornar o nome do titular da conta e o valor de todas as movimentações relacionadas a ele.

## Exercício 6: Use Alias para Tabelas e Colunas

Enunciado: Utilize aliases para tornar a consulta mais legível, retornando o nome do titular e o valor da movimentação.

## Exercício 7: Documente Suas Consultas

Enunciado: Escreva uma consulta para mostrar as movimentações acima de 500 e adicione um comentário explicando a lógica.

## Exercício 8: Limite Resultados com LIMIT ou TOP

Enunciado: Mostre os 5 primeiros registros da tabela REGISTRO que têm valor acima de 500.

## Exercício 9: Teste e Otimize Consultas com EXPLAIN

Enunciado: Escreva uma consulta para verificar a eficiência de uma busca no nome dos titulares com movimentações acima de 1000 usando EXPLAIN.

## Exercício 10: Evite Subconsultas Desnecessárias

Enunciado: Reescreva a seguinte consulta, que usa uma subconsulta, usando uma junção:
Consulta original:

```
SELECT * 
FROM EXTRATO 
WHERE ID IN (SELECT ID_EXTRATO FROM REGISTRO WHERE VALOR > 1000);
```

Escreva a consulta reescrita:
