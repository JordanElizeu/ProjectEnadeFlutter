import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';

void handleFirebaseLoginWithCredentialsException({@required FirebaseAuthException exceptionMessage, @required BuildContext context}) {
  final _informationUserDisabled = "O usuário informado está desabilitado.";
  final _informationUserNotFound = "O usuário informado não está cadastrado.";
  final _informationInvalidEmail = "O domínio do e-mail informado é inválido.";
  final _informationWrongPassword = "A senha informada está incorreta.";
  final unknownError = "Erro desconhecido";

  if (exceptionMessage.code == 'user-disabled') {
    alertDialogFailure(context: context, information: _informationUserDisabled);
  } else if (exceptionMessage.code == 'user-not-found') {
    alertDialogFailure(context: context, information: _informationUserNotFound);
  } else if (exceptionMessage.code == 'invalid-email') {
    alertDialogFailure(context: context, information: _informationInvalidEmail);
  } else if (exceptionMessage.code == 'wrong-password') {
    alertDialogFailure(context: context, information: _informationWrongPassword);
  } else {
    alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
  }
}

void handleFirebaseCreateUserWithEmailAndPasswordException({@required FirebaseAuthException exceptionMessage, @required BuildContext context}) {
  final _informationEmailAlreadyInUse = "Já existe uma conta com o endereço de e-mail digitado.";
  final _informationInvalidEmail = "Endereço de e-mail não é válido.";
  final _informationOperationNotAllowed = "Erro no servidor! Entre em contato com o administrador para solução do problema.";
  final _informationWeakPassword = "Senha não é forte o suficiente.";
  final unknownError = "Erro desconhecido";

  if (exceptionMessage.code == 'email-already-in-use') {
    alertDialogFailure(context: context, information: _informationEmailAlreadyInUse);
  } else if (exceptionMessage.code == 'invalid-email') {
    alertDialogFailure(context: context, information: _informationInvalidEmail);
  } else if (exceptionMessage.code == 'operation-not-allowed') {
    alertDialogFailure(context: context, information: _informationOperationNotAllowed);
    //Lançadas se as contas de e-mail/senha não estiverem habilitadas. Habilite contas de e-mail/senha no Console Firebase, na guia Auth.
  } else if (exceptionMessage.code == 'weak-password') {
    alertDialogFailure(context: context, information: _informationWeakPassword);
  } else {
    alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
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

  if (exceptionMessage.code == 'auth/invalid-email') {
    alertDialogFailure(context: context, information: _informationAuthOrEmailInvalid);
  } else if (exceptionMessage.code == 'auth/missing-android-pkg-name') {
    alertDialogFailure(context: context, information: _informationMissingAndroidPkgName);
  } else if (exceptionMessage.code == 'auth/missing-continue-uri') {
    alertDialogFailure(context: context, information: _informationUrlInvalid);
  } else if (exceptionMessage.code == 'auth/missing-ios-bundle-id') {
    alertDialogFailure(context: context, information: _informationMissingIosBundleId);
    //'Um ID do pacote do iOS deve ser fornecido se um ID da App Store for fornecido.
  } else if (exceptionMessage.code == 'auth/invalid-continue-uri') {
    alertDialogFailure(context: context, information: _informationUriContinueInvalid);
  } else if (exceptionMessage.code == 'auth/unauthorized-continue-uri') {
    alertDialogFailure(context: context, information: _informationUriContinueUnauthorized);
    //'O domínio da URL de continuação não está na lista branca. Lista branca do domínio no console Firebase.
  } else if (exceptionMessage.code == 'auth/user-not-found') {
    alertDialogFailure(context: context, information: _informationUserNotFound);
  }else{
    alertDialogFailure(context: context, title: unknownError, information: exceptionMessage.message);
  }
}