### Linguagem de Consulta a Dados (DQL – Data Query Language)

A **Data Query Language (DQL)** é uma parte da SQL (Structured Query Language) usada para realizar consultas em bancos de dados. Enquanto outros subconjuntos da SQL (como DML, DDL e DCL) lidam com manipulação de dados, definição de esquemas e controle de acesso, a DQL é focada especificamente na **recuperação de dados**.

A instrução principal da DQL é o comando `SELECT`, que permite consultar os dados de uma ou mais tabelas em um banco de dados. Vamos entender a estrutura básica da DQL e como ela pode ser aplicada com as entidades **EXTRATO**, **TIPO_REGISTRO** e **REGISTRO**.

---


### 1. O Comando SELECT

A consulta `SELECT` é usada para recuperar dados de uma ou mais tabelas. A sintaxe básica do `SELECT` é:

```sql
SELECT [colunas]
FROM [tabela]
WHERE [condições];
```

- **`SELECT`**: Especifica as colunas que você deseja exibir.
- **`FROM`**: Define a tabela de onde os dados serão obtidos.
- **`WHERE`**: Define as condições para filtrar os dados (opcional).

#### Exemplo Simples de Consulta

Vamos consultar todos os registros da entidade **EXTRATO**:

```sql
SELECT ID, NUMERO_CONTA, NOME_TITULAR
FROM EXTRATO;
```

**Resultado:**

| ID  | NUMERO_CONTA | NOME_TITULAR   |
|-----|-------------|---------------|
| 1   | 915201       | Rory Fry    |
| 2   | 67890       | Amari Black   |

---

![alt text](assets/sql-joins.png)

### 2. Filtros com a Cláusula WHERE

A cláusula `WHERE` permite restringir os resultados com base em uma ou mais condições. Por exemplo, podemos consultar apenas os registros de um titular específico.

#### Exemplo:

Vamos buscar o extrato do titular **Rory Fry**:

```sql
SELECT ID, NUMERO_CONTA, NOME_TITULAR
FROM EXTRATO
WHERE NOME_TITULAR = 'Rory Fry';
```

**Resultado:**

| ID  | NUMERO_CONTA | NOME_TITULAR   |
|-----|-------------|---------------|
| 1   | 915201       | Rory Fry    |

---

### 3. Operadores Lógicos e Comparativos

A consulta DQL permite o uso de operadores para filtrar e combinar múltiplas condições:

- **Operadores Lógicos**: `AND`, `OR`, `NOT`
- **Operadores Comparativos**: `=`, `>`, `<`, `>=`, `<=`, `<>`

#### Exemplo:

Vamos consultar os registros de movimentações financeiras (entidade **REGISTRO**) onde o valor da transação é maior que 500:

```sql
SELECT ID, VALOR, ID_TIPO, ID_EXTRATO
FROM REGISTRO
WHERE VALOR > 500;
```

**Resultado:**

| ID  | VALOR  | ID_TIPO | ID_EXTRATO |
|-----|--------|--------|-----------|
| 1   | 1000   | 1      | 1         |
| 3   | 1500   | 1      | 2         |

---

### 4. Ordenação com ORDER BY

Para ordenar os resultados, usamos a cláusula `ORDER BY`, que pode ser aplicada em uma ou mais colunas. Você pode ordenar os resultados de forma ascendente (`ASC`, que é o padrão) ou descendente (`DESC`).

#### Exemplo:

Vamos ordenar os registros de movimentações financeiras (entidade **REGISTRO**) pelo valor da transação, em ordem decrescente:

```sql
SELECT ID, VALOR, ID_TIPO, ID_EXTRATO
FROM REGISTRO
ORDER BY VALOR DESC;
```

**Resultado:**\

| ID  | VALOR  | ID_TIPO | ID_EXTRATO |
|-----|--------|--------|-----------|
| 3   | 1500   | 1      | 2         |
| 1   | 1000   | 1      | 1         |
| 4   | 500    | 3      | 2         |

---

### 5. Limitação de Resultados com LIMIT

Em alguns casos, você pode querer limitar o número de resultados retornados por uma consulta. O comando `LIMIT` é útil para restringir a quantidade de registros recuperados.

#### Exemplo:

Vamos buscar apenas os dois primeiros registros da entidade **REGISTRO**:

```sql
SELECT ID, VALOR, ID_TIPO, ID_EXTRATO
FROM REGISTRO
LIMIT 2;
```

**Resultado:**

| ID  | VALOR  | ID_TIPO | ID_EXTRATO |
|-----|--------|--------|-----------|
| 1   | 1000   | 1      | 1         |
| 2   | 200    | 2      | 1         |

---
