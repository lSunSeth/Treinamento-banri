# Manipulando Tabelas com DDL

A **Linguagem de Definição de Dados (DDL)** é a parte do SQL usada para definir e gerenciar a estrutura dos objetos em um banco de dados. Os comandos DDL não manipulam os dados que estão dentro das tabelas, mas sim a "espinha dorsal" que os contém.

Os comandos mais comuns da DDL são `CREATE TABLE`, para criar uma nova tabela, e `DROP TABLE`, para excluí-la.

---

### **1. Criando Tabelas com `CREATE TABLE`**

O comando `CREATE TABLE` é o primeiro passo para construir o seu banco de dados. Com ele, você define o nome da tabela, quais colunas ela terá e o tipo de dado que cada coluna pode armazenar.

**Sintaxe básica:**

```sql
CREATE TABLE NomeDaTabela (
    NomeDaColuna1 TIPO_DADO,
    NomeDaColuna2 TIPO_DADO,
    ...
);
Um exemplo prático seria a criação de uma tabela para armazenar informações de clientes:


```sql
CREATE TABLE Clientes (
    ClienteID INTEGER PRIMARY KEY,
    Nome TEXT,
    Email TEXT
);

Neste exemplo, a coluna `ClienteID` é definida como a **chave primária** (`PRIMARY KEY`), que é um identificador único para cada cliente.

Quando você tem tabelas relacionadas, também usa a `CREATE TABLE` para definir **chaves estrangeiras** (`FOREIGN KEY`), que conectam uma tabela a outra. Por exemplo, uma tabela `Pedidos` precisaria se conectar à tabela `Clientes`.

Vamos usar então este exemplo, onde temos uma tabela de **`Clientes`** e uma de **`Pedidos`**. Um cliente pode ter vários pedidos, mas cada pedido pertence a um único cliente.

Primeiro, você cria a tabela **`Clientes`** com sua chave primária.

```sql
CREATE TABLE Clientes (
    ClienteID INTEGER PRIMARY KEY,
    Nome TEXT
);
Depois, você cria a tabela **`Pedidos**`. É nela que você vai usar a `FOREIGN KEY` para fazer a ligação. O `ClienteID` na tabela **`Pedidos**` é uma chave estrangeira que aponta para o `ClienteID` na tabela **`Clientes**`.

```sql
CREATE TABLE Pedidos (
    PedidoID INTEGER PRIMARY KEY,
    Descricao TEXT,
    ClienteID INTEGER,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

A linha **"FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)"** é a que faz a mágica. Ela garante que, para cada pedido na tabela Pedidos, o valor na coluna `ClienteID` deve existir na tabela **`Clientes**`. Isso mantém a integridade dos seus dados.

### **2. Utilizando Índices Apropriadamente (somente conceito)**
Podemos criar índices em colunas que serão frequentemente usadas no futuro de modo a melhorar o desempenho do acesso a elas. No entanto, é necessário evitar sobrecarregar o banco de dados com muitos índices, pois isso pode afetar a performance de futuras inserções e atualizações de dados.
Os índices são criados da seguinte maneira:

```sql
CREATE INDEX idx_extrato_num_conta 
-- O prefixo 'idx_' é uma convenção de nomenclatura (boa prática)
-- para identificar rapidamente que o objeto é um índice, e não uma tabela ou visão.
ON PXC.EXTRATO(NUMERO_CONTA);

### **3. Excluindo Tabelas com `DROP TABLE`**
O comando `DROP TABLE` é o oposto do `CREATE TABLE`. Ele apaga a tabela inteira do banco de dados, incluindo todos os dados e sua estrutura.

Sintaxe básica:

```sql
DROP TABLE NomeDaTabela;

### **4. A Ordem da Exclusão é Importante**
Ao usar o `DROP TABLE`, você deve ter atenção com a ordem das operações se as tabelas estiverem relacionadas. Se uma tabela tiver uma **chave estrangeira** que aponta para outra, você deve apagar a tabela "filha" (aquela com a chave estrangeira) primeiro.

Por exemplo, se a tabela `Pedidos` se conecta à tabela `Clientes`, você deve apagar a tabela `Pedidos` primeiro. Caso contrário, o banco de dados dará um erro, pois a tabela `Clientes` ainda está sendo referenciada por `Pedidos`.

A regra é simples: apague a tabela "filha" (a que tem a chave estrangeira) antes de apagar a tabela "pai" (a que tem a chave primária).

Veja o exemplo de como fazer a exclusão na ordem correta:

```sql
-- Apaga a tabela `Pedidos` primeiro, pois ela depende de `Clientes`
DROP TABLE Pedidos;

-- Agora, apague a tabela `Clientes`
DROP TABLE Clientes;
