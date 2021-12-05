import 'package:project_enade/web/data/providers/quiz/provider_quiz_ads.dart';

class RepositoryQuizAds{

  Map<int, Map<String, String>> getMapOfQuestionAds(){
    return ProviderQuizAds().mapQuizAds();
  }
}