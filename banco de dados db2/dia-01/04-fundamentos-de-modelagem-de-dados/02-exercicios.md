### 1. Exercício de Normalização

#### Situação:

Você está desenvolvendo um sistema bancário que armazena os dados das movimentações financeiras dos clientes. Atualmente, todos os dados estão armazenados em uma única tabela, mas essa estrutura apresenta muita redundância de informações e dificulta a manutenção e integridade dos dados. Sua tarefa é normalizar essa tabela.

Aqui está a tabela atual chamada **Movimentacoes**:

| ID  | NUMERO_CONTA | NOME_TITULAR   | TIPO          | VALOR  |
|-----|-------------|---------------|---------------|--------|
| 1   | 915201       | Rory Fry    | Depósito      | 1000   |
| 2   | 915201       | Rory Fry    | Saque         | 200    |
| 3   | 67890       | Amari Black   | Depósito      | 1500   |
| 4   | 67890       | Amari Black   | Transferência | 500    |
| 5   | 915201       | Rory Fry    | Transferência | 300    |

#### Pergunta:

**A partir dessa tabela, aplique o processo de normalização até a Terceira Forma Normal (3NF). O resultado final deve ser três entidades separadas: EXTRATO, TIPO_REGISTRO e REGISTRO.**
