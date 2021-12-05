import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/data/providers/firebase/provider_database.dart';

class RepositoryDatabase {
  addResult({
    @required result,
    @required name,
    @required BuildContext context,
    @required disciplina,
  }) {
    return ProviderDatabase().addNewResult(
      result: result,
      name: name,
      context: context,
      disciplina: disciplina,
    );
  }

  showFinishResult({
    @required email,
    @required password,
    @required result,
    @required BuildContext context,
  }) {
    return ProviderDatabase().showFinishResult(
      email: email,
      password: password,
      result: result,
      context: context,
    );
  }

  getAllResults({@required BuildContext context}) {
    return ProviderDatabase().getAllResults(context: context);
  }
}
