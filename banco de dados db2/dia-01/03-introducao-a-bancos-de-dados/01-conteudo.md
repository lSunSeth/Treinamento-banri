# Curso de SQL
Vamos agora abordar o tópico **Fundamentos de Banco de Dados** com uma explicação completa, exemplos práticos e algumas curiosidades. Esse conteúdo pode ser utilizado no seu curso de SQL e NoSQL.

---

## Fundamentos de Banco de Dados

Um banco de dados é uma coleção organizada de dados que pode ser acessada, gerenciada e atualizada. Ele permite que grandes volumes de informações sejam armazenados de forma eficiente e estruturada, facilitando o processo de consulta e manipulação de dados por usuários e aplicativos.

Os bancos de dados são fundamentais para quase todas as aplicações modernas, seja um sistema de e-commerce, uma rede social ou um banco. Eles armazenam desde informações de clientes e produtos até dados complexos de transações financeiras.

### 1. O que é um Banco de Dados?

Um banco de dados é uma estrutura que organiza dados de maneira a facilitar seu uso. Pode-se pensar em um banco de dados como uma coleção de tabelas em que cada uma armazena dados sobre uma entidade específica, como clientes, produtos ou pedidos.

### 2. Tipos de Bancos de Dados

Existem bancos de dados, SQL e NoSQL. A principal diferença entre SQL e NoSQL é a estrutura de armazenamento dos dados: SQL usa um modelo relacional e rígido, enquanto NoSQL usa um modelo não relacional e flexível. 

Imagine que você é o responsável por organizar dois tipos de arquivos em um escritório:

#### **SQL: O Arquivo Organizado (Relacional)**: Pense no SQL como um sistema de arquivamento super organizado, com regras rígidas. 
- **Estrutura**: Tudo é guardado em tabelas com colunas e linhas predefinidas (como uma planilha do Excel com títulos fixos: "Nome", "Sobrenome", "ID do Cliente").
- **Regras**: Você não pode simplesmente adicionar uma coluna nova ("Apelido") sem reorganizar todo o arquivo primeiro. Os dados são estruturados e interligados por relações bem definidas (por exemplo, a tabela "Pedidos" se conecta à tabela "Clientes" pelo "ID do Cliente").
- **Ideal para**: Situações que exigem muita precisão e consistência, como sistemas bancários, controle de estoque ou e-commerce, onde cada dado precisa estar exatamente no lugar certo.
- **Exemplos**: MySQL, PostgreSQL, Oracle, Microsoft SQL Server. 



#### **NoSQL: A Caixa Flexível (Não Relacional)**: Pense no NoSQL como uma caixa onde você pode jogar documentos de vários formatos (pastas, papéis soltos, notas adesivas) sem um esquema fixo. 
- **Estrutura**: Não há tabelas rígidas. Você pode armazenar dados como documentos (JSON), pares chave-valor, grafos ou colunas largas. Cada "documento" pode ter campos diferentes do outro. Um cliente pode ter "Nome" e "Telefone", enquanto outro pode ter "Nome", "Telefone" e "Email".
- **Flexibilidade**: Você pode adicionar novas informações (como o campo "Apelido") a qualquer momento, sem afetar o restante do sistema. É ótimo para lidar com grandes volumes de dados que não têm uma estrutura clara ou que mudam frequentemente.
- **Ideal para**: Aplicações web com muitos usuários, redes sociais, blogs, ou sistemas que geram muitos dados não estruturados, onde a velocidade e a escalabilidade (crescimento fácil) são mais importantes do que a consistência absoluta.
- **Exemplos**: MongoDB, Cassandra, Redis, Neo4J. 


  - **Chave-Valor** (ex.: Redis)
  - **Documentos** (ex.: MongoDB)
  - **Colunas** (ex.: Cassandra)
  - **Grafos** (ex.: Neo4j)

#### Comparação entre SQL e NoSQL

| Característica             | SQL                                        | NoSQL                                  |
|----------------------------|--------------------------------------------|----------------------------------------|
| Estrutura                  | Esquemático (tabelas com linhas e colunas) | Esquema flexível (pode permitir dados com estruturas diferentes) |
| Relacionamento             | Relacionamentos definidos (chaves)         | Pode ou não ter relacionamentos        |
| Escalabilidade             | Vertical (mais poder de máquina)           | Horizontal (mais servidores)           |
| Consistência               | Alta (ACID)                                | Pode priorizar disponibilidade         |
| Linguagem de Consulta      | SQL                                        | Depende do banco, algumas usam APIs    |

![acid](assets/acid.png) 


> **Curiosidade**: O termo "NoSQL" foi criado em 1998 para descrever um banco de dados simples, mas o movimento como o conhecemos hoje começou por volta de 2009, impulsionado pelas necessidades de escalabilidade em grandes sistemas da web.

### 3. Componentes de um Banco de Dados

Os bancos de dados são compostos por diversos elementos que facilitam a sua operação e manutenção. Os componentes básicos incluem:

- **Tabelas**: Estruturas fundamentais em bancos de dados relacionais, que contêm linhas e colunas. Cada tabela representa uma entidade, e cada linha (ou registro) representa uma instância dessa entidade.
  
  Exemplo de uma tabela de **Clientes**:
  
  | ClienteID | Nome         | Telefone       |
  |-----------|--------------|----------------|
  | 1         | Rory Fry     | 9999-9999      |
  | 2         | Amari Black  | 8888-8888      |

- **Registros (Linhas)**: Cada linha de uma tabela é um registro. No exemplo acima, o registro do cliente "Rory Fry" é uma linha na tabela "Clientes".
  
- **Campos (Colunas)**: Cada coluna de uma tabela armazena um atributo específico da entidade. No exemplo acima, "Nome" e "Telefone" são colunas da tabela "Clientes".
  
- **Chaves Primárias**: São identificadores únicos para cada registro em uma tabela. No exemplo, "ClienteID" é a chave primária que identifica de forma única cada cliente.
  
- **Chaves Estrangeiras**: São usadas para definir relações entre tabelas. Uma chave estrangeira em uma tabela aponta para uma chave primária em outra, ligando dados entre diferentes entidades.

- **Índices**: Servem para otimizar a velocidade das consultas em grandes volumes de dados. Eles funcionam como um índice de um livro, facilitando o acesso a informações específicas.

### 4. Operações em Bancos de Dados (CRUD)

As quatro operações básicas realizadas em bancos de dados são referidas como operações **CRUD**:

- **Create (Criar)**: Inserção de novos dados no banco.
  ```sql
  INSERT INTO Clientes (ClienteID, Nome, Telefone) VALUES (1, 'Rory Fry', '9999-9999');
  ```
- **Read (Ler)**: Consulta de dados existentes.
  ```sql
  SELECT * FROM Clientes;
  ```
- **Update (Atualizar)**: Modificação de dados existentes.
  ```sql
  UPDATE Clientes SET Telefone = '7777-7777' WHERE ClienteID = 1;
  ```
- **Delete (Deletar)**: Exclusão de dados.
  ```sql
  DELETE FROM Clientes WHERE ClienteID = 1;
  ```

> **Curiosidade**: O termo CRUD é amplamente utilizado em todos os sistemas de gerenciamento de banco de dados e também em APIs que interagem com dados.


### 5. Transações e Propriedades ACID

Uma transação é um conjunto de operações que são executadas como uma única unidade. As propriedades **ACID** garantem que as transações sejam processadas de forma confiável:

- **Atomicidade (A)**: Todas as operações de uma transação são completadas com sucesso ou nenhuma delas é.
- **Consistência (C)**: A transação leva o banco de dados de um estado consistente a outro estado consistente.
- **Isolamento (I)**: As transações são executadas de forma independente, sem interferência de outras.
- **Durabilidade (D)**: Uma vez que uma transação é confirmada, as alterações são permanentes, mesmo em caso de falha de sistema.

> **Curiosidade**: Os sistemas de banco de dados distribuídos modernos, como o Google Spanner, conseguem fornecer propriedades ACID em escala global, algo que era considerado impossível há algumas décadas.

### 5. Banco de Dados Distribuídos

Em um banco de dados distribuído, os dados são armazenados em vários locais físicos diferentes, mas parecem ser uma única unidade lógica. Isso é comum em grandes sistemas que precisam de alta disponibilidade e escalabilidade.

Bancos de dados distribuídos utilizam técnicas como **replicação** e **sharding**:

- **Replicação**: Copiar dados para vários servidores para aumentar a disponibilidade e a tolerância a falhas.
- **Sharding**: Dividir os dados entre diferentes servidores, o que melhora o desempenho ao reduzir a carga em cada servidor.
