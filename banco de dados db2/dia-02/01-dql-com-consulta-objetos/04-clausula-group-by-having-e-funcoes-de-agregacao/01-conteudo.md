### Cláusula GROUP BY, HAVING e Funções de Agregação (COUNT, AVG, SUM, MAX, MIN)

A **cláusula `GROUP BY`** e a **cláusula `HAVING`** são elementos fundamentais na linguagem SQL que permitem agregar dados e aplicar funções de agregação a conjuntos de registros. Este tópico explorará cada um desses conceitos, juntamente com funções de agregação, usando as entidades **EXTRATO**, **TIPO_REGISTRO** e **REGISTRO** como exemplos.

---

### 1. **Funções de Agregação**

As funções de agregação permitem realizar cálculos sobre um conjunto de valores, retornando um único valor como resultado. As funções mais comuns incluem:

- **COUNT()**: Conta o número de registros.
- **SUM()**: Soma todos os valores de uma coluna.
- **AVG()**: Calcula a média dos valores de uma coluna.
- **MAX()**: Retorna o maior valor de uma coluna.
- **MIN()**: Retorna o menor valor de uma coluna.

**Exemplo:**

Suponha que queremos calcular o total de movimentações da tabela **REGISTRO**.

```sql
SELECT SUM(VALOR) AS TotalMovimentacoes
FROM REGISTRO;
```

**Resultado Esperado:**

| TotalMovimentacoes |
|--------------------|
| 3500               |

---

### 2. **Cláusula GROUP BY**

A cláusula `GROUP BY` é utilizada para agrupar os resultados de uma consulta com base em uma ou mais colunas. Ao usar `GROUP BY`, podemos aplicar funções de agregação a cada grupo de registros.

**Exemplo:**

Vamos supor que queremos contar quantas movimentações existem por tipo de registro na tabela **REGISTRO**, agrupando pelo `ID_TIPO`.

```sql
SELECT ID_TIPO, COUNT(*) AS TotalMovimentacoes
FROM REGISTRO
GROUP BY ID_TIPO;
```

**Resultado Esperado:**

| ID_TIPO | TotalMovimentacoes |
|--------|--------------------|
| 1      | 3                  |
| 2      | 2                  |

Neste exemplo, estamos agrupando as movimentações por `ID_TIPO` e contando quantas existem em cada grupo.

---

### 3. **Cláusula HAVING**

A cláusula `HAVING` é usada em conjunto com `GROUP BY` para filtrar os grupos resultantes com base em condições. Enquanto a cláusula `WHERE` filtra registros antes da agregação, a cláusula `HAVING` filtra grupos após a agregação.

**Exemplo:**

Suponha que queremos contar quantas movimentações existem por tipo de registro, mas apenas para os tipos que têm mais de uma movimentação.

```sql
SELECT ID_TIPO, COUNT(*) AS TotalMovimentacoes
FROM REGISTRO
GROUP BY ID_TIPO
HAVING COUNT(*) > 1;
```

**Resultado Esperado:**

| ID_TIPO | TotalMovimentacoes |
|--------|--------------------|
| 1      | 3                  |

Neste exemplo, a cláusula `HAVING` garante que apenas os tipos de registro com mais de uma movimentação sejam exibidos.

---

### 4. **Combinação de GROUP BY, HAVING e Funções de Agregação**

Podemos combinar `GROUP BY`, `HAVING` e funções de agregação para realizar análises mais complexas.

**Exemplo:**

Suponha que queremos calcular a soma total das movimentações agrupadas por `ID_TIPO` e exibir apenas os tipos de registro que possuem uma soma total superior a 500.

```sql
SELECT ID_TIPO, SUM(VALOR) AS TotalValor
FROM REGISTRO
GROUP BY ID_TIPO
HAVING SUM(VALOR) > 500;
```

**Resultado Esperado:**

| ID_TIPO | TotalValor |
|--------|------------|
| 1      | 1500       |

Neste exemplo, estamos somando os valores das movimentações por tipo de registro e filtrando para mostrar apenas os tipos que possuem um total superior a 500.

---

### 5. **Uso de Funções de Agregação com Outras Cláusulas**

Podemos usar funções de agregação juntamente com outras cláusulas, como `ORDER BY`, para ordenar os resultados.

**Exemplo:**

Vamos calcular o número total de movimentações por tipo e ordenar os resultados em ordem decrescente.

```sql
SELECT ID_TIPO, COUNT(*) AS TotalMovimentacoes
FROM REGISTRO
GROUP BY ID_TIPO
ORDER BY TotalMovimentacoes DESC;
```

**Resultado Esperado:**

| ID_TIPO | TotalMovimentacoes |
|--------|--------------------|
| 1      | 3                  |
| 2      | 2                  |

Neste exemplo, os tipos de registro estão ordenados pelo número total de movimentações em ordem decrescente.

---