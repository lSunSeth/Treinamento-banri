### Cláusula JOIN para Consultas Envolvendo Junções de Tabelas

A cláusula `JOIN` em SQL é utilizada para combinar registros de duas ou mais tabelas com base em uma condição relacionada entre elas. Essa técnica é fundamental para trabalhar com bancos de dados relacionais, onde os dados estão frequentemente distribuídos em diferentes tabelas. Neste tópico, abordaremos o produto cartesiano, junções internas, e a sintaxe ANSI de junção (INNER, LEFT, RIGHT, FULL, CROSS) usando as entidades **EXTRATO**, **TIPO_REGISTRO** e **REGISTRO** como exemplos.

---

### 1. **Produto Cartesiano**

O produto cartesiano é o resultado da combinação de todos os registros de duas ou mais tabelas, sem considerar qualquer condição de junção. Ele gera um conjunto de resultados que é o número de registros da primeira tabela multiplicado pelo número de registros da segunda tabela.

**Exemplo:**

Suponha que tenhamos duas tabelas: **EXTRATO** e **TIPO_REGISTRO**. Se a tabela **EXTRATO** tiver 3 registros e a tabela **TIPO_REGISTRO** tiver 2 registros, o produto cartesiano resultará em 6 registros.

```sql
SELECT *
FROM EXTRATO, TIPO_REGISTRO;
```

**Resultado Esperado:**

| ID | NUMERO_CONTA | NOME_TITULAR | ID | TIPO        |
|----|-------------|-------------|----|-------------|
| 1  | 915201       | Rory Fry  | 1  | SAIDA     |
| 1  | 915201       | Rory Fry  | 2  | Débito      |
| 2  | 67890       | Amari Black | 1  | SAIDA     |
| 2  | 67890       | Amari Black | 2  | Débito      |
| 3  | 54321       | Pedro Lima  | 1  | SAIDA     |
| 3  | 54321       | Pedro Lima  | 2  | Débito      |

### 2. **Junções Internas (INNER JOIN)**

![image](../../assets/sql-joins.png)

O `INNER JOIN` retorna apenas os registros que têm correspondência em ambas as tabelas. É a junção mais comum e é usada quando precisamos filtrar os dados.

**Exemplo:**

Vamos fazer uma consulta para obter os registros de **REGISTRO** que estão relacionados ao **EXTRATO**.

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**Resultado Esperado:**

| NUMERO_CONTA | VALOR |
|--------------|-------|
| 915201        | 500   |
| 67890        | 200   |

Neste exemplo, estamos recuperando a `NUMERO_CONTA` e o `VALOR` das movimentações que têm uma correspondência na tabela **EXTRATO**.

### 3. **Junções Externas**

#### 3.1 **LEFT JOIN (ou LEFT OUTER JOIN)**

O `LEFT JOIN` retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita. Se não houver correspondência, os resultados da tabela à direita serão `NULL`.

**Exemplo:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
LEFT JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**Resultado Esperado:**

| NUMERO_CONTA | VALOR |
|--------------|-------|
| 915201        | 500   |
| 67890        | 200   |
| 54321        | NULL  |

Aqui, todos os registros da tabela **EXTRATO** são retornados, e para o registro `54321`, que não tem correspondência na tabela **REGISTRO**, o valor é `NULL`.

#### 3.2 **RIGHT JOIN (ou RIGHT OUTER JOIN)**

O `RIGHT JOIN` é o oposto do `LEFT JOIN`: ele retorna todos os registros da tabela à direita e os registros correspondentes da tabela à esquerda.

**Exemplo:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
RIGHT JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**Resultado Esperado:**

| NUMERO_CONTA | VALOR |
|--------------|-------|
| 915201        | 500   |
| 67890        | 200   |
| NULL         | 300   |

Neste caso, todos os registros da tabela **REGISTRO** são retornados, e para aqueles que não têm correspondência na tabela **EXTRATO**, o valor será `NULL`.

#### 3.3 **FULL JOIN (ou FULL OUTER JOIN)**

O `FULL JOIN` retorna todos os registros quando há uma correspondência em uma das tabelas. Isso significa que ele combina o resultado do `LEFT JOIN` e do `RIGHT JOIN`.

**Exemplo:**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
FULL JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

**Resultado Esperado:**

| NUMERO_CONTA | VALOR |
|--------------|-------|
| 915201        | 500   |
| 67890        | 200   |
| 54321        | NULL  |
| NULL         | 300   |

Aqui, todos os registros de ambas as tabelas são retornados, independentemente de haver correspondência.

### 4. **CROSS JOIN**

O `CROSS JOIN` gera um produto cartesiano entre duas tabelas. Este tipo de junção não precisa de uma condição de junção.

**Exemplo:**

```sql
SELECT E.NUMERO_CONTA, TIPO.TIPO
FROM EXTRATO E
CROSS JOIN TIPO_REGISTRO TIPO;
```

**Resultado Esperado:**

| NUMERO_CONTA | TIPO        |
|--------------|-------------|
| 915201        | SAIDA     |
| 915201        | Débito      |
| 67890        | SAIDA     |
| 67890        | Débito      |
| 54321        | SAIDA     |
| 54321        | Débito      |

No exemplo, cada `NUMERO_CONTA` é combinada com cada tipo de registro, gerando um produto cartesiano.

---

### 5. **Sintaxe ANSI de Junção**

A sintaxe ANSI para junções oferece uma forma mais legível de definir junções em SQL, onde as condições de junção são especificadas de maneira mais clara. A seguir, exemplos de cada tipo de junção usando a sintaxe ANSI.

#### 5.1 **INNER JOIN**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

#### 5.2 **LEFT JOIN**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
LEFT JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

#### 5.3 **RIGHT JOIN**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
RIGHT JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

#### 5.4 **FULL JOIN**

```sql
SELECT E.NUMERO_CONTA, R.VALOR
FROM EXTRATO E
FULL JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
```

#### 5.5 **CROSS JOIN**

```sql
SELECT E.NUMERO_CONTA, TIPO.TIPO
FROM EXTRATO E
CROSS JOIN TIPO_REGISTRO TIPO;
```

---