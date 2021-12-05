import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';

class ProviderExceptions{

  handleFirebaseLoginWithCredentialsException({@required FirebaseAuthException exceptionMessage, @required BuildContext context}) {
    final _informationUserDisabled = "O usuário informado está desabilitado.";
    final _informationUserNotFound = "O usuário informado não está cadastrado.";
    final _informationInvalidEmail = "O domínio do e-mail informado é inválido.";
    final _informationWrongPassword = "A senha informada está incorreta.";
    final unknownError = "Erro desconhecido";

    switch(exceptionMessage.code){
      case 'user-disabled':
        alertDialogFailure(context: context, information: _informationUserDisabled);
        break;
      case 'user-not-found':
        alertDialogFailure(context: context, information: _informationUserNotFound);
        break;
      case 'invalid-email':
        alertDialogFailure(context: context, information: _informationInvalidEmail);
        break;
      case 'wrong-password':
        alertDialogFailure(context: context, information: _informationWrongPassword);
        break;
      default:
        alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
        break;
    }

  }

  void handleFirebaseCreateUserWithEmailAndPasswordException({@required FirebaseAuthException exceptionMessage, @required BuildContext context}) {
    final _informationEmailAlreadyInUse = "Já existe uma conta com o endereço de e-mail digitado.";
    final _informationInvalidEmail = "Endereço de e-mail não é válido.";
    final _informationOperationNotAllowed = "Erro no servidor! Entre em contato com o administrador para solução do problema.";
    final _informationWeakPassword = "Senha não é forte o suficiente.";
    final unknownError = "Erro desconhecido";

    switch (exceptionMessage.code){
      case 'email-already-in-use':
        alertDialogFailure(context: context, information: _informationEmailAlreadyInUse);
        break;
      case 'invalid-email':
        alertDialogFailure(context: context, information: _informationInvalidEmail);
        break;
      case 'operation-not-allowed':
        alertDialogFailure(context: context, information: _informationOperationNotAllowed);
        break;
      case 'weak-password':
        alertDialogFailure(context: context, information: _informationWeakPassword);
        break;
      default:
        alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
        break;
    }

  }

  void handleFirebaseSendPasswordResetEmailException({@required FirebaseAuthException exceptionMessage, @required BuildContext context}) {
    final _informationAuthOrEmailInvalid = "Endereço de e-mail inválido.";
    final _informationMissingAndroidPkgName = "Um nome do pacote Android deve ser fornecido se o aplicativo android for necessário para ser instalado.";
    final _informationUrlInvalid = "Url inválida ou inexistente.";
    final _informationMissingIosBundleId = "Erro no servidor! Entre em contato com o desenvolvedor para solução do problema.";
    final _informationUriContinueInvalid = "Url inválido na solicitação de uma nova senha.";
    final _informationUriContinueUnauthorized = "Acesse não autorizado! entre em contato com o desenvolvedor para mais detalhes.";
    final _informationUserNotFound = "não existe usuário correspondente ao endereço de e-mail digitado.";
    final unknownError = "Erro desconhecido";

    switch (exceptionMessage.code){
      case 'auth/invalid-email':
        alertDialogFailure(context: context, information: _informationAuthOrEmailInvalid);
        break;
      case 'auth/missing-android-pkg-name':
        alertDialogFailure(context: context, information: _informationMissingAndroidPkgName);
        break;
      case 'auth/missing-continue-uri':
        alertDialogFailure(context: context, information: _informationUrlInvalid);
        break;
      case 'auth/missing-ios-bundle-id':
        alertDialogFailure(context: context, information: _informationMissingIosBundleId);
        break;
      case 'auth/invalid-continue-uri':
        alertDialogFailure(context: context, information: _informationUriContinueInvalid);
        break;
      case 'auth/unauthorized-continue-uri':
        alertDialogFailure(context: context, information: _informationUriContinueUnauthorized);
        break;
      case 'auth/user-not-found':
        alertDialogFailure(context: context, information: _informationUserNotFound);
        break;
      default:
        alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
        break;

    }

  }
}