import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/data/firebase.dart';
import 'controller_questions.dart';

class ControllerQuizNetwork extends GetxController{

  var _questionSelectedRadiusNetwork = 0;
  var showQuestionScreenNetwork = 1;
  var _numberCorrectQuestionsNetwork = 0;
  var _numberIncorrectQuestionsNetwork = 10;
  var listIncorrectQuestionsNetwork = [];

  set questionSelectedRadiusNetwork(value) {
    _questionSelectedRadiusNetwork = value;
  }
  get questionSelectedRadiusNetwork => _questionSelectedRadiusNetwork;

  final String _disciplina = "REDES";

  void incrementNetwork(value) {
    _questionSelectedRadiusNetwork = value;
    print(_questionSelectedRadiusNetwork);
    update();
  }

  String getTitleNetwork() {
    return _questionsNetwork[showQuestionScreenNetwork]["title"];
  }

  String getItemNetwork(String textNumberItem) {
    int numberItem = ControllerQuestions().getNumberItemOfQuestion(textNumberItem);
    return _questionsNetwork[showQuestionScreenNetwork]["item$numberItem"];
  }

  //valida se acertou a questão
  _validatorQuestionsResultNetwork(){
    int response = ControllerQuestions().getResponse(_questionsNetwork,showQuestionScreenNetwork);
    if(response == _questionSelectedRadiusNetwork){
      _numberCorrectQuestionsNetwork ++;
    }else{
      listIncorrectQuestionsNetwork.add("Questão: $showQuestionScreenNetwork");
      listIncorrectQuestionsNetwork.add("Resposta: ${_questionsNetwork[showQuestionScreenNetwork]["response"]}");
    }
  }

  buttonConfirmResponseForNewQuestionNetwork(BuildContext context) async {
    final _informationAlertDialogSuccess = "Questionário Finalizado!\nPara refazer o teste inicie novamente o questionario.\n\nQuestões incorretas: ${_numberIncorrectQuestionsNetwork - _numberCorrectQuestionsNetwork}";
    final _titleAlertDialogSuccess = "Nota: $_numberCorrectQuestionsNetwork de 10";
    final _titleAlertDialogFailure = "Confirme sua resposta";
    final _informationAlertDialogFailure = "Selecione um item como resposta!";

    if (_questionSelectedRadiusNetwork == 0) {
      alertDialogFailure(information: _informationAlertDialogFailure, context: context, title: _titleAlertDialogFailure);
    }else if (showQuestionScreenNetwork == 10){
      Map<dynamic, dynamic> map = await getInformationOfUserOn(context);
      final name = map["nome"];
      ControllerQuestions().questionarioFinalizado(
          title: _titleAlertDialogSuccess,
          context: context,
          result: _numberCorrectQuestionsNetwork,
          questionSelectedRadius: _questionSelectedRadiusNetwork,
          showQuestionScreen: showQuestionScreenNetwork,
          name: name,
          information: _informationAlertDialogSuccess,
          disciplina: _disciplina);
    }else{
      _validatorQuestionsResultNetwork();
      _questionSelectedRadiusNetwork = 0;
      showQuestionScreenNetwork ++;
      update();
    }
  }

  Map<int, Map<String, String>> _questionsNetwork = {
    1: {
      "image": "not found",
      "title":
      "No servidor web Apache 2.4, o diretório utilizado pelo serviço para servir arquivos é definido pela diretiva",
      "item1": " Directory.",
      "item2": "DocumentRoot.",
      "item3": "DefaultRuntimeDir.",
      "item4": "ServerPath.",
      "item5": "ServerRoot.",
      "response": "b",
    },
    2: {
      "image": "not found",
      "title":
      "Em redes de computadores, estão diretamente relacionados ao compartilhamento de arquivos os protocolos",
      "item1": "DNS e DHCP.",
      "item2": "NIS e FTP.",
      "item3": "NTP e ICMP.",
      "item4": "SMB e NFS.",
      "item5": "TCP/IP e SNMP.",
      "response": "d",
    },
    3: {
      "image": "not found",
      "title":
      "No contexto de gerenciamento de processos e fluxos de execução (threads) em sistemas operacionais, assinale a alternativa em que todos os itens listados sejam privados para cada thread, isto é, não são compartilhados com outros threads no mesmo processo.",
      "item1": "Arquivos abertos e registradores.",
      "item2": "Arquivos abertos e pilha.",
      "item3": "Registradores e pilha.",
      "item4": "Espaço de endereçamento e registradores.",
      "item5": "Espaço de endereçamento e arquivos abertos.",
      "response": "c",
    },
    4: {
      "image": "not found",
      "title":
      " Uma empresa faz um backup completo dos arquivos de seu servidor todo domingo, dia em que não há expediente, e esses arquivos não sofrem alterações nem novos arquivos são criados. De segunda a sábado, em horários pós-expediente, são feitos backups apenas dos arquivos que foram alterados ou criados em relação ao backup do dia anterior. Os backups realizados de segunda a sábado são classificados como",
      "item1": "avulsos.",
      "item2": "completos.",
      "item3": "incrementais.",
      "item4": "diferenciais.",
      "item5": "espelhos.",
      "response": "c",
    },
    5: {
      "image": "not found",
      "title":
      "No esquema de endereçamento IP classful, a classe C permite endereçar quantos hosts dentro do mesmo identificador de rede?",
      "item1": "254.",
      "item2": "255.",
      "item3": "256.",
      "item4": "257.",
      "item5": "258.",
      "response": "a",
    },
    6: {
      "image": "assets/images/question6_ads",
      "title":
      "Assinale a alternativa que contenha apenas protocolo(s) que é (são) considerado(s) da camada de transporte do modelo TCP/IP:",
      "item1": "IP e TCP.",
      "item2": "IP, TCP e UDP.",
      "item3": "IP.",
      "item4": "TCP e UDP.",
      "item5": "IP e UDP.",
      "response": "d",
    },
    7: {
      "image": "assets/images/question6_ads",
      "title":
      "Um site disponibiliza comunicação segura via SSL/TLS, no entanto, faz uso de um certificado autoassinado ao invés de um assinado por uma entidade confiável. Por conta disso, o acesso ao site sob essas condições viola o atributo de",
      "item1": "autenticidade.",
      "item2": "confidencialidade.",
      "item3": "disponibilidade.",
      "item4": "integridade.",
      "item5": "irretratabilidade.",
      "response": "a",
    },
    8: {
      "image": "not found",
      "title":
      "Um usuário mal-intencionado enviou um e-mail para o diretor de uma empresa, muito semelhante aos enviados pelo banco, com o intuito de coletar informações pessoais. Esse tipo comum de ataque é conhecido como",
      "item1": "negação de serviço (DoS).",
      "item2": "flooding.",
      "item3": "força bruta.",
      "item4": "phishing.",
      "item5": "spoofing.",
      "response": "d",
    },
    9: {
      "image": "not found",
      "title":
      "metodologia de autenticação que usa dois ou mais fatores como evidência para identificar o usuário visa",
      "item1": "dificultar o acesso ao sistema.",
      "item2": "discipliná-lo a usar mecanismos seguros de autenticação.",
      "item3": "forçá-lo a utilizar senhas seguras.",
      "item4": "impedir o compartilhamento das credenciais de acesso.",
      "item5":
      "minimizar o impacto caso uma das formas de autenticação tenha sido comprometida.",
      "response": "a",
    },
    10: {
      "image": "not found",
      "title":
      "No modelo relacional de bancos de dados, há um tipo de valor que pode ser atribuído a atributos de um conjunto de entidades. Tal tipo de valor indica, por exemplo, que esse valor é desconhecido ou que não existe. Essa definição corresponde ao tipo de valor denominado",
      "item1": "multivalorado.",
      "item2": "individual.",
      "item3": "temporário.",
      "item4": "parcial.",
      "item5": "nulo.",
      "response": "e",
    },
  };
}