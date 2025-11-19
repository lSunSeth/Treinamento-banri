---

#### Solução Esperada

O objetivo é normalizar a tabela **Movimentacoes**, dividindo os dados em diferentes tabelas para eliminar redundâncias e garantir a integridade dos dados. Após a normalização, o resultado final deve ser:

1. **Entidade EXTRATO**:
   - Atributos: **ID**, **NUMERO_CONTA**, **NOME_TITULAR**

2. **Entidade TIPO_REGISTRO**:
   - Atributos: **ID**, **TIPO**

3. **Entidade REGISTRO**:
   - Atributos: **ID**, **VALOR**, **ID_TIPO** (referência a TIPO_REGISTRO), **ID_EXTRATO** (referência a EXTRATO)

---

#### Passos da Normalização

1. **Primeira Forma Normal (1NF)**:
   - Cada coluna deve conter valores atômicos. A tabela atual já está na 1NF, pois não há múltiplos valores em uma única célula.

2. **Segunda Forma Normal (2NF)**:
   - A 2NF exige que todos os atributos não-chave sejam dependentes completamente da chave primária.
   - Nesta etapa, vamos eliminar as redundâncias de **NUMERO_CONTA** e **NOME_TITULAR** que se repetem para o mesmo cliente.
   - Vamos criar uma tabela **EXTRATO** para armazenar os dados de contas e titulares, com uma chave primária separada.

   **Tabela EXTRATO**:
   | ID  | NUMERO_CONTA | NOME_TITULAR   |
   |-----|-------------|---------------|
   | 1   | 915201       | Rory Fry    |
   | 2   | 67890       | Amari Black   |

3. **Terceira Forma Normal (3NF)**:
   - A 3NF elimina dependências transitivas. Observamos que a coluna **TIPO** (Depósito, Saque, Transferência) está repetida para cada movimentação.
   - Vamos criar uma tabela **TIPO_REGISTRO** para armazenar os tipos de registro de forma única.

   **Tabela TIPO_REGISTRO**:
   | ID  | TIPO          |
   |-----|---------------|
   | 1   | Depósito      |
   | 2   | Saque         |
   | 3   | Transferência |

4. Agora, criamos a tabela final de **REGISTRO** que relaciona os valores das movimentações com os tipos de registro e os extratos.

   **Tabela REGISTRO**:
   | ID  | VALOR  | ID_TIPO | ID_EXTRATO |
   |-----|--------|--------|-----------|
   | 1   | 1000   | 1      | 1         |
   | 2   | 200    | 2      | 1         |
   | 3   | 1500   | 1      | 2         |
   | 4   | 500    | 3      | 2         |
   | 5   | 300    | 3      | 1         |

---

### Conclusão

Ao aplicar a normalização, removemos as redundâncias e garantimos a integridade dos dados. Agora, temos três entidades independentes que se relacionam por meio de chaves estrangeiras:

- A tabela **EXTRATO** armazena os dados dos clientes.
- A tabela **TIPO_REGISTRO** armazena os tipos de movimentação (como depósito, saque e transferência).
- A tabela **REGISTRO** relaciona as movimentações financeiras com os respectivos tipos e clientes.