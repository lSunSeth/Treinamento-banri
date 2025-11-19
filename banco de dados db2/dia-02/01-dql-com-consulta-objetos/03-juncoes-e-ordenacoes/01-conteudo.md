## Ordenação de Resultados de Consultas Compostas

### 1. **Cláusula ORDER BY**

A cláusula `ORDER BY` permite ordenar os resultados de uma consulta com base em uma ou mais colunas. Os resultados podem ser ordenados em ordem crescente (`ASC`) ou decrescente (`DESC`).

**Exemplo Simples:**

Para ordenar os registros da tabela **EXTRATO** pelo `NUMERO_CONTA` em ordem crescente, podemos usar:

```sql
SELECT * 
FROM EXTRATO 
ORDER BY NUMERO_CONTA ASC;
```

### 2. **Ordenação em Consultas Compostas**

Quando trabalhamos com consultas que envolvem múltiplas tabelas, a ordenação pode ser aplicada a colunas de diferentes tabelas. Vamos ver um exemplo com uma consulta que junta as tabelas **EXTRATO**, **REGISTRO** e **TIPO_REGISTRO**, ordenando os resultados por múltiplas colunas.

**Exemplo de Consulta Composta:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR, T.TIPO
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO
INNER JOIN TIPO_REGISTRO T ON R.ID_TIPO = T.ID
ORDER BY T.TIPO ASC, R.VALOR DESC;
```

**Neste exemplo:**

- **Objetivo:** Listar as contas (`NUMERO_CONTA`), valores (`VALOR`) e tipos (`TIPO`).
- **Junções:** As tabelas **EXTRATO**, **REGISTRO** e **TIPO_REGISTRO** estão sendo unidas.
- **Ordenação:** 
  - Primeiro, os resultados são ordenados pelo tipo (`TIPO`) em ordem crescente.
  - Em seguida, dentro de cada tipo, os valores (`VALOR`) são ordenados em ordem decrescente.

### 3. **Considerações sobre Ordenação**

- **Ordenação por Múltiplas Colunas:** Quando várias colunas são especificadas na cláusula `ORDER BY`, a ordem de prioridade é dada da esquerda para a direita. Por exemplo, se você ordenar primeiro por `TIPO` e depois por `VALOR`, a consulta primeiro agrupará por `TIPO` e, em seguida, ordenará os valores dentro de cada tipo.
  
- **NULLs na Ordenação:** O comportamento de valores `NULL` na ordenação pode variar de acordo com o banco de dados. Em geral, os valores `NULL` são ordenados antes dos valores não `NULL` em uma ordem crescente e depois em uma ordem decrescente.

### 4. **Exemplo Prático Completo**

Imaginemos que temos as seguintes tabelas:

- **EXTRATO**
  - ID: 1, NUMERO_CONTA: '915201', NOME_TITULAR: 'Rory Fry'
  - ID: 2, NUMERO_CONTA: '54321', NOME_TITULAR: 'Amari Black'

- **REGISTRO**
  - ID: 1, VALOR: 500, ID_EXTRATO: 1, ID_TIPO: 1
  - ID: 2, VALOR: 200, ID_EXTRATO: 2, ID_TIPO: 2

- **TIPO_REGISTRO**
  - ID: 1, TIPO: 'Débito'
  - ID: 2, TIPO: 'SAIDA'

Ao executar a consulta:

```sql
SELECT E.NUMERO_CONTA, R.VALOR, T.TIPO
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO
INNER JOIN TIPO_REGISTRO T ON R.ID_TIPO = T.ID
ORDER BY T.TIPO ASC, R.VALOR DESC;
```

**Resultado:**

| NUMERO_CONTA | VALOR | TIPO    |
|--------------|-------|---------|
| 54321       | 200   | SAIDA |
| 915201       | 500   | Débito  |


## Autojunção e Junções Equivalentes/Não Equivalentes

Neste tópico, abordaremos o conceito de autojunção, bem como as junções equivalentes e não equivalentes. Vamos utilizar as entidades **EXTRATO**, **TIPO_REGISTRO** e **REGISTRO** para ilustrar os conceitos com exemplos práticos.

---

### 1. **Autojunção (Self Join)**

A autojunção é uma junção em que uma tabela é unida a ela mesma. Isso pode ser útil quando se deseja comparar registros dentro da mesma tabela ou quando há relações hierárquicas entre os dados. Para realizar uma autojunção, é necessário usar aliases para diferenciar as instâncias da tabela.

**Exemplo:**

Suponha que desejamos listar os extratos e seus respectivos tipos de registro. Para isso, faremos uma autojunção na tabela **REGISTRO**.

```sql
SELECT R1.ID AS ID_REGISTRO1, R1.VALOR, R2.ID AS ID_REGISTRO2
FROM REGISTRO R1
INNER JOIN REGISTRO R2 ON R1.ID_EXTRATO = R2.ID_EXTRATO AND R1.ID <> R2.ID;
```

**Resultado Esperado:**

| ID_REGISTRO1 | VALOR | ID_REGISTRO2 |
|---------------|-------|---------------|
| 1             | 500   | 2             |
| 2             | 200   | 1             |

Neste exemplo, estamos comparando registros na tabela **REGISTRO** que pertencem ao mesmo extrato, mas têm IDs diferentes.

---

### 2. **Junções Equivalentes**

Junções equivalentes são aquelas que podem ser expressas de diferentes maneiras, mas que retornam os mesmos resultados. Por exemplo, um `INNER JOIN` pode ser escrito usando a sintaxe ANSI ou a sintaxe implícita.

**Exemplo:**

**Sintaxe ANSI:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**Sintaxe Implícita:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E, REGISTRO R
WHERE E.ID = R.ID_EXTRATO;
```

Ambas as consultas retornam os mesmos resultados, listando as `NUMERO_CONTA` e `VALOR` dos registros que correspondem nas tabelas **EXTRATO** e **REGISTRO**.

---

### 3. **Junções Não Equivalentes**

Junções não equivalentes, por outro lado, podem retornar resultados diferentes dependendo da estrutura e das condições especificadas nas junções. Por exemplo, o uso de `LEFT JOIN` em comparação com `INNER JOIN` pode resultar em conjuntos de dados diferentes.

**Exemplo:**

**INNER JOIN:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**LEFT JOIN:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
LEFT JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

- **Resultados do `INNER JOIN`:** Retorna apenas as contas que têm registros associados.
- **Resultados do `LEFT JOIN`:** Retorna todas as contas da tabela **EXTRATO**, mesmo aquelas que não têm registros na tabela **REGISTRO**. Para essas contas, o `VALOR` será `NULL`.