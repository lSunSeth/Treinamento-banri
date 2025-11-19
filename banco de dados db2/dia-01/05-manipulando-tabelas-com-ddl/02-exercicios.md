### Exercício 1: Crie Três Tabelas

Use a plataforma **db-fiddle.com** e selecione o banco de dados **SQLite 3.46** no canto superior esquerdo.

Com base nas imagens, crie as tabelas `EXTRATO`, `TIPO_REGISTRO` e `REGISTRO`.

* **1.1. Crie a tabela `EXTRATO` com as colunas `ID` (chave primária), `NUMERO_CONTA` e `NOME_TITULAR`.**
* **1.2. Crie a tabela `TIPO_REGISTRO` com as colunas `ID` (chave primária) e `TIPO`.**
* **1.3. Crie a tabela `REGISTRO` com as colunas `ID` (chave primária), `VALOR`, `ID_TIPO` e `ID_EXTRATO`.** Configure `ID_TIPO` e `ID_EXTRATO` como chaves estrangeiras.

---

### Exercício 2: Exclua as Tabelas na Ordem Correta

Agora, apague as tabelas na ordem certa para evitar erros.

* **2.1. Apague a tabela `REGISTRO`.**
* **2.2. Apague as tabelas `EXTRATO` e `TIPO_REGISTRO`.**