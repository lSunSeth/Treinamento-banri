### Exercícios Básicos de DQL

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO", então o comando
"SELECT * FROM EXTRATO" se torna "SELECT * FROM PXC.EXTRATO".**

1. **Exercício 1: Seleção Básica**
   - **Pergunta**: Escreva uma consulta SQL para selecionar todos os registros da tabela **EXTRATO**. Liste todos os atributos.
   - **Dica**: Utilize `SELECT *`.

2. **Exercício 2: Seleção com WHERE**
   - **Pergunta**: Escreva uma consulta SQL que retorne os `NUMERO_CONTA` e `NOME_TITULAR` da tabela **EXTRATO** onde o `NOME_TITULAR` é "Rory Fry".
   - **Dica**: Utilize a cláusula `WHERE`.

3. **Exercício 3: Operadores Lógicos**
   - **Pergunta**: Escreva uma consulta SQL para selecionar os registros da tabela **EXTRATO** onde o `NUMERO_CONTA` é "915201" ou o `NOME_TITULAR` é "Amari Black".
   - **Dica**: Utilize operadores lógicos (`OR`).

4. **Exercício 4: ORDER BY**
   - **Pergunta**: Escreva uma consulta SQL que retorne todos os registros da tabela **EXTRATO** ordenados pelo `NOME_TITULAR` em ordem alfabética.
   - **Dica**: Utilize a cláusula `ORDER BY`.

5. **Exercício 5: LIMIT**
   - **Pergunta**: Escreva uma consulta SQL que retorne os primeiros 3 registros da tabela **REGISTRO**.
   - **Dica**: Utilize a cláusula `LIMIT`.

6. **Exercício 6: Seleção com Múltiplas Condições**
   - **Pergunta**: Escreva uma consulta SQL que retorne todos os `NUMERO_CONTA` da tabela **EXTRATO** onde o `NOME_TITULAR` é "Rory Fry" e o `ID` é maior que 1.
   - **Dica**: Utilize a cláusula `WHERE` com múltiplas condições.

---

