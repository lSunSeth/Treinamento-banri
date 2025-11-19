# Manipulando Dados com DML

A **Linguagem de Manipulação de Dados (DML)** é usada para interagir com o conteúdo das tabelas, ou seja, com os registros e as informações que estão dentro delas. Os comandos DML permitem que você adicione, consulte, atualize e apague dados. Eles correspondem às operações **CRUD** que você aprendeu na aula de introdução.

---

### **1. Criando Registros com `INSERT`**

O comando `INSERT` é usado para adicionar novos registros (linhas) a uma tabela.

**Sintaxe básica:**

```sql
INSERT INTO NomeDaTabela (coluna1, coluna2, ...)
VALUES (valor1, valor2, ...);
```
Exemplo:

```sql
INSERT INTO Clientes (Nome, Email)
VALUES ('João da Silva', 'joao.silva@email.com');
```
### **2. Atualizando Registros com `UPDATE`**
O comando `UPDATE` é usado para modificar dados que já existem em uma tabela.

**Sintaxe básica:**

```sql
UPDATE NomeDaTabela
SET coluna1 = novo_valor1, coluna2 = novo_valor2, ...
WHERE condicao;
```
Atenção: A cláusula `WHERE` é fundamental. Se você não a usar, todos os registros da tabela serão atualizados.

Exemplo:

```sql
-- Altera o email do cliente com o ID 1
UPDATE Clientes
SET Email = 'novo.email@provedor.com'
WHERE ClienteID = 1;
```
### **3. Deletando Registros com `DELETE`**
O comando `DELETE` é usado para remover registros de uma tabela.

**Sintaxe básica:**

```sql
DELETE FROM NomeDaTabela
WHERE condicao;
```
Atenção: Assim como no `UPDATE`, a cláusula `WHERE` é crucial para evitar que todos os registros da tabela sejam apagados.

Exemplo:
```sql
-- Deleta o cliente com o ID 5
DELETE FROM Clientes
WHERE ClienteID = 5;
```
### **4. Usando Transações Quando Necessário (somente conceito)**

**Consistência**: Utiliza-se transações para garantir a consistência dos dados em operações que envolvem múltiplas instruções SQL. Isso garante que todas as operações sejam executadas com sucesso ou, caso contrário, que nenhuma delas seja aplicada.

**Observação: As operações de transação (TRANSACTION) não são feitas diretamente na camada do banco de dados, pois são usadas em aplicações com framework MM e realizadas de forma abstraída. Mesmo assim, introduzir o conceito em SQL o torna familiar e será proveitoso para uso futuro.**

Segue abaixo um exemplo de como são feitas transações em SQL para fins de exemplificação (esta operação não irá funcionar no software Consulta Objetos):
```sql
BEGIN TRANSACTION;
INSERT INTO EXTRATO (NUMERO_CONTA, NOME_TITULAR) VALUES (915201, 'Rory Fry');
UPDATE REGISTRO SET VALOR = VALOR + 100 WHERE ID_EXTRATO = 1;
COMMIT;
```
