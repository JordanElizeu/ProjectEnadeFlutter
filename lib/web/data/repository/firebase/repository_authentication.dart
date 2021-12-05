import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/data/providers/firebase/provider_authentication.dart';

class RepositoryAuthentication {

  addNewUser({
    @required email,
    @required password,
    @required name,
    @required BuildContext context,
  }) {
    return ProviderAuthentication().addNewUser(
      email: email,
      password: password,
      name: name,
      context: context,
    );
  }

  loginUser(
      {@required email,
      @required matricula,
      @required password,
      @required BuildContext context}) {
    return ProviderAuthentication().loginAccount(
      email: email,
      matricula: matricula,
      password: password,
      context: context,
    );
  }

  getInformationUser({@required BuildContext context}) {
    return ProviderAuthentication().getUser(context: context);
  }
}
