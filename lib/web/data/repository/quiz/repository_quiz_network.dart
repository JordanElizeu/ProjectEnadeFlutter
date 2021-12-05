import 'package:project_enade/web/data/providers/quiz/provider_quiz_network.dart';

class RepositoryQuizNetwork{

  Map<int, Map<String, String>> getMapOfQuestionNetwork(){
    return ProviderQuizNetwork().mapQuizNetwork();
  }
}