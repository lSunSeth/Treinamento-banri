
## Laboratório

Neste laboratório, importe novamente o _boilerplate_ de **solução Cliente-Servidor - v2** fornecido na pasta desta aula. Você perceberá que o "framework" desse boilerplate agora evoluiu. Ele passou a ter um terceiro projeto, que agora agrega as funcionalidades de suporte ao cliente e ao servidor, e também adicionou utilitários para montagem da conexão HTTP e _serialização_ e _desserialização_ de JSON. Ou seja, agora o sistema tem suporte a requisições utilizando JSON ao invés de texto simples. Com isso, agora se torna necessária a utilização de objetos no cliente, para que possa fazer requisições ao servidor.

Vamos criar um exemplo de POST no cliente:

### Passo 1: Criar classe `Saudacao` no Cliente

Vamos criar uma nova classe na raíz do projeto **Cliente**, chamada `Saudacao`:

```csharp
namespace Cliente
{
    public class Saudacao
    {
        public string PronomeTratamento { get; set; }
        public string Nome { get; set; }
        public string Cumprimento { get; set; }
        public int NumeroCumprimentos { get; set; }
    }
}
```

### Passo 2: Implementar POST no Cliente

No método `Main` da `Program.cs` do projeto **Cliente**, vamos enviar uma instância de `Saudacao` por POST:

```csharp
public static void Main(string[] args)
{
   // [...]

   // TODO: Implementar um POST
   var saudacao = new Saudacao()
   {
      Cumprimento = "Salve",
      NumeroCumprimentos = 2,
      PronomeTratamento = "Sr.",
      Nome = "John Doe",
   };

   cliente.EnviarPost(ConectorHttp.ObterCaminho(), saudacao); // using PseudoFramework.SharedUtils;

   // [...]
}
```

> Nota: Após, o comentário com **TODO** pode ser removido.

Já no lado do servidor, agora o mesmo aceita a implementação de [Hook](/dicionario-banrisul.md#hook)s, que servem basicamente para que **código personalizado ligado ao fluxo da requisição possa ser executado** enquanto a requisição trafega pelo servidor.

Vamos implementar a interceptação do POST através do hook:

### Passo 1: Criar classe `Saudacao` no Servidor

Criar a mesma classe `Saudacao`, agora na raíz do projeto **Servidor**:

```csharp
namespace Servidor
{
    public class Saudacao
    {
      public string PronomeTratamento { get; set; }
      public string Nome { get; set; }
      public string Cumprimento { get; set; }
      public int NumeroCumprimentos { get; set; }
    }
}
```

### Passo 2: Implementar interceptação de POST no Servidor

Vamos implementar o hook para interceptar o método POST no servidor (mais especificamente sua classe `Program`):

```csharp
public static void Main(string[] args)
{
   // [...]

   // TODO: Implementar hook de POST
   servidor.ProcessarHook = (verbo, caminho, json) =>
   {
         if (verbo == "POST")
         {
            Saudacao saudacao = ConversorJson.Desserializar<Saudacao>(json);

            string cumprimentos = string.Concat(Enumerable.Repeat(saudacao.Cumprimento + " ", saudacao.NumeroCumprimentos)); // using System.Linq;

            string saudacaoExpressao = $"{cumprimentos}{saudacao.PronomeTratamento} {saudacao.Nome}!";

            Console.WriteLine($"\n\n{saudacaoExpressao} \n");

            var momento = DateTime.Now;

            return new
            {
               origem = ServidorHttp.IDENTIFICADOR,
               verboHttp = verbo,
               caminho = caminho,
               momento = momento,
               respostaString = $"Resposta de {ServidorHttp.IDENTIFICADOR} para a requisição {verbo} em {caminho} processada às {momento} \"{saudacaoExpressao}\": OK"
            };
         }

         return null;
   };

   // [...]
}
```

> Nota: Após, o comentário com **TODO** pode ser removido.

Execute as duas aplicações e verifique se a comunicação `POST` foi bem sucedida nos respectivos consoles.

## [Exercícios](02-exercicios.md)
