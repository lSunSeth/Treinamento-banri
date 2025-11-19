### Exercícios

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO", então o comando
"SELECT * FROM EXTRATO" se torna "SELECT * FROM PXC.EXTRATO".**

#### **Exercício 1: Junção com Condições Múltiplas**
Escreva uma consulta que retorne o nome do titular da conta, o tipo de movimentação e o valor total das movimentações maiores que 500, agrupadas por titular e tipo de movimentação.

- **Tabelas**: EXTRATO, TIPO_REGISTRO, REGISTRO
- **Condições**:
  1. Filtrar movimentações com valor maior que 500.
  2. Agrupar os resultados por nome do titular e tipo de movimentação.


#### **Exercício 2: Consulta com Função Agregada e Ordenação**
Crie uma consulta que retorne o tipo de movimentação e o valor médio das movimentações agrupadas por tipo. Os resultados devem ser ordenados pelo valor médio em ordem decrescente.

- **Tabelas**: TIPO_REGISTRO, REGISTRO
- **Condições**:
  1. Agrupar por tipo de movimentação.
  2. Ordenar os resultados pelo valor médio (descendente).


#### **Exercício 3: Contagem com JOIN**
Escreva uma consulta que conte quantas movimentações cada titular de conta realizou, independentemente do tipo de movimentação.

- **Tabelas**: EXTRATO, REGISTRO
- **Condições**:
  1. Agrupar os resultados pelo nome do titular da conta.



#### **Exercício 4: Consulta com Subconsulta**
Utilize uma subconsulta para retornar os titulares que possuem uma movimentação cujo valor é superior à média de todas as movimentações.

- **Tabelas**: EXTRATO, REGISTRO
- **Condições**:
  1. Filtrar titulares com movimentações maiores que a média de todas as movimentações.


#### **Exercício 5: Uso de Funções de Data**
Considere que existe uma coluna `DATA` na entidade **REGISTRO**, que armazena a data em que cada movimentação foi realizada. Crie uma consulta que retorne o nome do titular e o valor total de todas as movimentações realizadas nos últimos 30 dias.

- **Tabelas**: EXTRATO, REGISTRO
- **Coluna adicional**: `DATA` (na entidade REGISTRO)
- **Condições**:
  1. Filtrar movimentações dos últimos 30 dias.
  2. Agrupar por titular.


#### **Exercício 6: Consulta com HAVING**
Crie uma consulta que retorne os titulares que tenham um valor total de movimentações superior a 1000. Use a cláusula `HAVING` para filtrar o resultado.

- **Tabelas**: EXTRATO, REGISTRO
- **Condições**:
  1. Agrupar os resultados por titular.
  2. Filtrar pelo valor total de movimentações maior que 1000.
