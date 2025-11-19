### **Exercício 1: Inserindo Dados com `INSERT`**

**Lembrete: em todas as queries que mencionarem tabelas do sistema PXC é necessário adicionar o prefixo "PXC." ao nome da tabela. Por exemplo, a tabela "EXTRATO" se torna "PXC.EXTRATO".**

Para este exercício, você precisará primeiro descobrir qual é o último ID utilizado em cada tabela.

* **1.1. Passo 1: Descubra o maior ID de cada tabela.**
    Execute a seguinte consulta para as tabelas `EXTRATO` e `REGISTRO` para encontrar o maior `ID` em uso em cada uma (`ID máximo`).
	
    ```sql
    SELECT MAX(ID) FROM NOME_DA_TABELA;
    ```
    **Lembre-se dos valores.**

* **1.2. Passo 2: Escreva as consultas `INSERT`**
    Agora, com base nos dados abaixo e no valor máximo de `ID` que você encontrou, escreva as consultas `INSERT` para popular as tabelas. Use os novos IDs a partir do `(ID máximo + 1)` para evitar conflitos.

    * **Tabela `EXTRATO`:**
        * Primeiro registro: **ID** = `(ID máximo + 1)`, `NUMERO_CONTA` = `915201`, `NOME_TITULAR` = `'Rory Fry'`
        * Segundo registro: **ID** = `(ID máximo + 2)`, `NUMERO_CONTA` = `67890`, `NOME_TITULAR` = `'Amari Black'`

    * **Tabela `REGISTRO`:**
        * Primeiro registro: **ID** = `(ID máximo + 1)`, `VALOR` = `1500`, **`ID_TIPO`** = `(ID do novo 'Depósito')`, **`ID_EXTRATO`** = `(ID do novo 'Rory Fry')`
        * Segundo registro: **ID** = `(ID máximo + 2)`, `VALOR` = `50`, **`ID_TIPO`** = `(ID do novo 'Saque')`, **`ID_EXTRATO`** = `(ID do novo 'Rory Fry')`
        * Terceiro registro: **ID** = `(ID máximo + 3)`, `VALOR` = `200`, **`ID_TIPO`** = `(ID do novo 'Depósito')`, **`ID_EXTRATO`** = `(ID do novo 'Amari Black')`

> **Importante:** Após escrever e executar suas consultas `INSERT`, os dados estarão prontos para os exercícios a seguir.

---

### **Exercício 2: Consultando Dados com `SELECT`**

Escreva as consultas para responder às seguintes perguntas:

* **2.1. Encontre o registro da conta de 'Rory Fry' e selecione todas as suas informações (incluindo o ID).**
* **2.2. Liste todos os titulares de conta (`NOME_TITULAR`) e seus respectivos números de conta (`NUMERO_CONTA`) da tabela `EXTRATO`.**
* **2.3. Encontre todos os registros de transações (valor e tipo de registro) que foram realizados na conta de 'Amari Black'.**

---

### **Exercício 3: Atualizando Dados com `UPDATE`**

* **3.1. O nome do titular 'Rory Fry' está incorreto e deve ser alterado para 'Alexia Smith'. Crie uma consulta para atualizar este registro na tabela `EXTRATO`.**
* **3.2. A pessoa que sacou dinheiro de sua conta, na verdade, sacou `75`, e não `50` como foi registrado anteriormente. Crie uma consulta para corrigir o valor do saque na tabela `REGISTRO`.**
* **3.3. O número da conta de 'Amari Black' mudou para `99999`. Crie uma consulta para atualizar este registro na tabela `EXTRATO`.**


---

### **Exercício 3: Excluindo Dados com `DELETE`**

* **4.1. Exclua o registro na tabela `REGISTRO` onde o `ID` seja `3`.**
* **4.2. Exclua o registro na tabela `TIPO_REGISTRO` onde o `ID` seja `2`.**