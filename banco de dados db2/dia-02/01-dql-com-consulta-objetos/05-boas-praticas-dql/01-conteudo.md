### Boas Práticas para Consultas de Dados em Estruturas Relacionais

Ao trabalhar com bancos de dados relacionais, seguir boas práticas nas consultas SQL é essencial para garantir eficiência, legibilidade e manutenção do código. Aqui estão algumas recomendações:

---

### 1. **Use Nomes Descritivos para Tabelas e Colunas**

- **Clareza**: Os nomes devem refletir o conteúdo da tabela ou da coluna. Por exemplo, use `EXTRATO` em vez de `T1` ou `dados1`.
- **Consistência**: Mantenha um padrão de nomenclatura (camelCase, snake_case, etc.) em todo o banco de dados.

### 2. **Selecione Apenas as Colunas Necessárias**

- **Performance**: Em vez de usar `SELECT *`, especifique apenas as colunas necessárias na consulta. Isso reduz a quantidade de dados transferidos e melhora o desempenho.

```sql
SELECT NUMERO_CONTA, NOME_TITULAR FROM PXC.EXTRATO;
```

### 3. **Utilize Filtragem Adequada com WHERE**

- **Eficiência**: Use a cláusula `WHERE` para filtrar registros desnecessários. Isso não só melhora a performance, mas também torna os resultados mais relevantes.

```sql
SELECT * FROM PXC.REGISTRO WHERE VALOR > 1000;
```

### 4. **Evite Funções em Colunas da Cláusula WHERE**

- **Performance**: Quando possível, evite aplicar funções nas colunas da cláusula `WHERE`, pois isso pode impedir o uso de índices.

```sql
-- Evite isso
SELECT * FROM PXC.REGISTRO WHERE YEAR(DATA) = 2024;

-- Prefira
SELECT * FROM PXC.REGISTRO WHERE DATA >= '2024-01-01' AND DATA < '2025-01-01';
```

### 5. **Use JOINs de Forma Eficiente**

- **Relacionamentos**: Ao usar `JOIN`, especifique o tipo de junção (INNER, LEFT, RIGHT, etc.) e sempre forneça condições de junção claras.

```sql
SELECT E.NOME_TITULAR, R.VALOR
FROM PXC.EXTRATO E
JOIN PXC.REGISTRO R ON E.ID = R.ID_EXTRATO;
```

### 6. **Use Alias para Tabelas e Colunas**

- **Legibilidade**: Use aliases (`AS`) para tornar a consulta mais legível, especialmente em consultas complexas.

```sql
SELECT E.NUMERO_CONTA AS Conta, R.VALOR AS Montante
FROM PXC.EXTRATO E
JOIN PXC.REGISTRO R ON E.ID = R.ID_EXTRATO;
```

### 7. **Documente Suas Consultas**

- **Comentários**: Use comentários para explicar partes complexas da consulta. Isso ajuda na manutenção futura e na compreensão por outros desenvolvedores.

```sql
-- Seleciona os titulares com movimentações acima de 1000
SELECT NOME_TITULAR
FROM PXC.EXTRATO E
JOIN PXC.REGISTRO R ON E.ID = R.ID_EXTRATO
WHERE R.VALOR > 1000;
```

### 8. **Limite Resultados com LIMIT ou TOP**

- **Desempenho**: Ao trabalhar com grandes conjuntos de dados, utilize `LIMIT` (MySQL, PostgreSQL) ou `TOP` (SQL Server) para limitar o número de resultados retornados, especialmente em situações de teste.

```sql
SELECT * FROM PXC.REGISTRO LIMIT 10;
```

### 9. **Teste e Otimize Consultas**

- **Análise de Performance**: Utilize ferramentas de análise de consultas (como `EXPLAIN` no MySQL/PostgreSQL) para entender como a consulta é executada e identifique gargalos.

```sql
EXPLAIN SELECT NOME_TITULAR FROM PXC.EXTRATO;
```

Observação: no software Consulta Objetos o comando `EXPLAIN` **não é utilizado a partir da adição do termo na frente da query**, mas sim a partir de um botão disponível na parte superior da interface como mostra a imagem abaixo.

![alt text](../../assets/CO-sql-explain.png)

### 10. **Evite Subconsultas Desnecessárias**

- **Performance**: Sempre que possível, substitua subconsultas por junções, pois as junções tendem a ter melhor desempenho.

```sql
-- Evite isso
SELECT * FROM PXC.EXTRATO WHERE ID IN (SELECT ID_EXTRATO FROM PXC.REGISTRO WHERE VALOR > 1000);

-- Prefira
SELECT E.*
FROM PXC.EXTRATO E
JOIN PXC.REGISTRO R ON E.ID = R.ID_EXTRATO
WHERE R.VALOR > 1000;
```