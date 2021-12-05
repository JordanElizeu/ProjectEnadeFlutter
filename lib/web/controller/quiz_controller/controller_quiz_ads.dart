import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerQuizAds extends GetxController {

  static Map<int, Map<String, String>> mapAdsQuestions = {
    1: {
      "image": "not found",
      "title":
          "Considerando a orientação a objetos, assinale a alternativa que define corretamente o que é polimorfismo.",
      "item1":
          "O armazenamento de objetos de forma permanente, para posterior recuperação em novas execuções do programa",
      "item2":
          "O armazenamento de objetos de forma permanente, para posterior recuperação em novas execuções do programa",
      "item3": "Uma solução reusável para um problema comum.",
      "item4":
          "Uma unidade coesa de funcionalidades que podem ser desenvolvidas e entregues independentemente para compor uma unidade maior",
      "item5":
          "Diferentes objetos podem responder à mesma mensagem de maneiras diferentes, possibilitando que objetos interajam uns com os outros sem conhecer seus tipos exatos.",
      "response": "e",
    },
    2: {
      "image": "not found",
      "title":
          "Na orientação a objetos, para que um atributo de uma classe C possa ser acessado apenas por qualquer método de C ou por qualquer método definido em subclasses de C, sua visibilidade deve ser",
      "item1": "privada (private).",
      "item2": "privada (private).",
      "item3": "protegida (protected)",
      "item4": "pacote (package).",
      "item5": "pacote (package).",
      "response": "c",
    },
    3: {
      "image": "not found",
      "title":
          "Na Linguagem HTML, o marcador input define um campo de entrada de dados, por meio do qual se digitam as informações requeridas por um formulário. A opção desse marcador que permite que essa entrada de dados seja um campo do tipo sim/não, exibindo várias opções, mas que só se aceita que uma delas seja escolhida, é a",
      "item1": "Radio.",
      "item2": "Text.",
      "item3": "Binary",
      "item4": "Checkbox",
      "item5": "TrueFalseBox",
      "response": "a",
    },
    4: {
      "image": "not found",
      "title":
          "O método adequado para remover um recurso em uma chamada REST baseada em HTTP é:",
      "item1": "GET /caminho/para/recurso",
      "item2": "HEAD /caminho/para/recurso",
      "item3": "POST /caminho/para/recurso",
      "item4": "PATCH /caminho/para/recurso",
      "item5": "DELETE /caminho/para/recurso",
      "response": "e",
    },
    5: {
      "image": "not found",
      "title":
          "Em um código-fonte de um programa construído com base na orientação a objetos, há um método M abstrato não-estático em uma classe C. Isso significa que",
      "item1":
          "uma chamada a M requer uma implementação do mesmo em uma subclasse de C.",
      "item2":
          "M pode ser chamado diretamente no contexto da classe C, sem necessidade de se ter uma instância de C ou de uma de suas subclasses.",
      "item3":
          "é uma função avulsa, que é definida fora do contexto de uma classe.",
      "item4": "a visibilidade de M é pública.",
      "item5": "M não recebe nenhum parâmetro.",
      "response": "a",
    },
    6: {
      "image": "assets/images/question6_ads",
      "title": "Ao final da execução do algoritmo, a variável R terá o valor",
      "item1": "3.",
      "item2": "4.",
      "item3": "5.",
      "item4": "6.",
      "item5": "7.",
      "response": "b",
    },
    7: {
      "image": "assets/images/question6_ads",
      "title":
          "Assinale a alternativa que apresenta o número de vezes que o bloco de comandos dentro do fluxo de controle Enquanto é executado no algoritmo.",
      "item1": "0.",
      "item2": "1.",
      "item3": "2.",
      "item4": "3.",
      "item5": "4.",
      "response": "c",
    },
    8: {
      "image": "not found",
      "title":
          "Considere as afirmações.Todos os administradores são analistas. Alguns programadores são administradores, mas não todos.A partir dessas afirmações é correto concluir que",
      "item1": "os programadores que são analistas também são administradores.",
      "item2":
          "os administradores que não são programadores também não são analistas.",
      "item3": "os programadores que são administradores também são analistas.",
      "item4": "os administradores que são analistas também são programadores.",
      "item5":
          "os programadores que não são analistas também são administradores.",
      "response": "c",
    },
    9: {
      "image": "not found",
      "title":
          "Uma afirmação que corresponda à negação lógica da afirmação: “Se o resultado não bateu, então o meio de campo está enrolado”, é:",
      "item1": "O resultado não bateu e o meio de campo não está enrolado.",
      "item2": "O resultado não bateu e o meio de campo não está enrolado.",
      "item3": "O resultado bateu e o meio de campo não está enrolado.",
      "item4": "Se o resultado bateu, então o meio de campo não está enrolado.",
      "item5": "O resultado bateu ou o meio de campo não está enrolado.",
      "response": "a",
    },
    10: {
      "image": "not found",
      "title":
          "O CMMI para desenvolvimento agrupa os componentes de seu modelo nas seguintes três categorias, que são denominadas:",
      "item1": "específicas, exemplificadas e sistemáticas.",
      "item2": "genéricas, incompletas e completas.",
      "item3": "introdutórias, numeradas e otimizadas.",
      "item4": "requeridas, esperadas e informativas.",
      "item5": "referenciadas, capazes e unitárias.",
      "response": "d",
    },
  };
}
