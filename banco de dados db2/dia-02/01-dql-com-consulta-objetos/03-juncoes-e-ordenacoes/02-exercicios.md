# Exercícios de SQL: Ordenação e Junções

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO", então o comando
"SELECT * FROM EXTRATO" se torna "SELECT * FROM PXC.EXTRATO".**

## **Conteúdo:** Ordenação de Resultados (`ORDER BY`), Autojunção, Junções Equivalentes e Não Equivalentes.

---

### **Cenário das Tabelas (Para todos os exercícios)**

Considere as seguintes tabelas e dados:

| Tabela | Colunas | Dados de Exemplo |
| :--- | :--- | :--- |
| **EXTRATO** (E) | ID, NUMERO\_CONTA, NOME\_TITULAR | (1, '915201', 'Rory Fry'), (2, '54321', 'Amari Black'), (3, '11111', 'Sem Mov.') |
| **REGISTRO** (R) | ID, VALOR, ID\_EXTRATO, ID\_TIPO | (1, 500.00, 1, 1), (2, 200.00, 2, 2), (3, 75.50, 1, 2) |
| **TIPO\_REGISTRO** (T) | ID, TIPO | (1, 'Débito'), (2, 'SAIDA'), (3, 'Entrada') |

---

### **Parte 1: Ordenação de Resultados (`ORDER BY`)**

1.  **Ordenação Simples:**
    * **Objetivo:** Crie uma consulta que selecione todos os campos da tabela **REGISTRO** e ordene os resultados pelo campo `VALOR` em ordem **decrescente**.

2.  **Ordenação Múltipla em Consulta Composta:**
    * **Objetivo:** Crie uma consulta que junte **EXTRATO**, **REGISTRO** e **TIPO\_REGISTRO** para listar o `NUMERO_CONTA`, o `TIPO` (do registro) e o `VALOR`. A ordenação deve ser feita primeiro pelo **`TIPO` em ordem crescente** e, em seguida, pelo **`VALOR` em ordem crescente**.

3.  **Prioridade de Ordenação:**
    * **Pergunta:** Baseado na consulta do exercício 2, qual será o primeiro critério de ordenação aplicado?

---

### **Parte 2: Junções**

4.  **Autojunção (Self Join):**
    * **Objetivo:** Crie uma autojunção na tabela **REGISTRO** para listar todos os pares de registros (R1 e R2) que pertencem ao **mesmo extrato** (`ID_EXTRATO`), mas que têm **valores diferentes** (`VALOR`).
    * **Colunas a Selecionar:** `R1.ID` (como `ID_REGISTRO_1`), `R1.VALOR`, `R2.ID` (como `ID_REGISTRO_2`), `R2.VALOR`.

5.  **Junção Equivalente (Sintaxe Implícita):**
    * **Objetivo:** Reescreva o `INNER JOIN` a seguir usando a sintaxe de **junção implícita** (usando a cláusula `WHERE` para a condição de junção).
    * **Original:**
        ```sql
        SELECT E.NUMERO_CONTA, R.VALOR
        FROM EXTRATO E
        INNER JOIN REGISTRO R ON E.ID = R.ID_EXTRATO;
        ```

6.  **Junção Não Equivalente (`LEFT JOIN`):**
    * **Objetivo:** Escreva uma consulta para listar **todas** as contas da tabela **EXTRATO**, juntamente com o `VALOR` do registro associado, se houver.
    * *Dica: Esta junção deve incluir a conta 'Sem Mov.' que não possui registro na tabela **REGISTRO***.

7.  **Diferença de Junções:**
    * **Pergunta:** Qual é a principal diferença no conjunto de resultados entre o `INNER JOIN` (do exercício 5) e o `LEFT JOIN` (do exercício 6)?
