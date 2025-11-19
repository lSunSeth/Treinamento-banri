### Exercícios sobre JOINS

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO", então o comando
"SELECT * FROM EXTRATO" se torna "SELECT * FROM PXC.EXTRATO".**

1. **Exercício 1: INNER JOIN**
   - **Pergunta**: Escreva uma consulta SQL que retorne o `NUMERO_CONTA` e o `VALOR` dos registros que possuem correspondência entre as tabelas **EXTRATO** e **REGISTRO**.
   - **Dica**: Utilize a cláusula `INNER JOIN`.

2. **Exercício 2: LEFT JOIN**
   - **Pergunta**: Escreva uma consulta SQL que mostre todos os `NUMERO_CONTA` da tabela **EXTRATO** e os respectivos `VALOR` da tabela **REGISTRO**. Caso não haja correspondência, o `VALOR` deve aparecer como `NULL`.
   - **Dica**: Utilize a cláusula `LEFT JOIN`.

3. **Exercício 3: RIGHT JOIN**
   - **Pergunta**: Escreva uma consulta SQL que retorne todos os registros da tabela **REGISTRO** e os `NUMERO_CONTA` correspondentes da tabela **EXTRATO**. Se não houver correspondência, o `NUMERO_CONTA` deve aparecer como `NULL`.
   - **Dica**: Utilize a cláusula `RIGHT JOIN`.

4. **Exercício 4: FULL OUTER JOIN**
   - **Pergunta**: Escreva uma consulta SQL que exiba todos os `NUMERO_CONTA` da tabela **EXTRATO** e todos os `VALOR` da tabela **REGISTRO**. Os resultados devem incluir todos os registros, mesmo se não houver correspondência entre as tabelas.
   - **Dica**: Utilize a cláusula `FULL JOIN`.

5. **Exercício 5: CROSS JOIN**
   - **Pergunta**: Escreva uma consulta SQL que retorne um produto cartesiano entre a tabela **EXTRATO** e a tabela **TIPO_REGISTRO**, mostrando o `NUMERO_CONTA` e o `TIPO`.
   - **Dica**: Utilize a cláusula `CROSS JOIN`.

---

