import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/components/response_dialog.dart';

void handleFirebaseLoginWithCredentialsException(FirebaseAuthException e,{@required BuildContext context}) {
  final _informationUserDisabled = "O usuário informado está desabilitado.";
  final _informationUserNotFound = "O usuário informado não está cadastrado.";
  final _informationInvalidEmail = "O domínio do e-mail informado é inválido.";
  final _informationWrongPassword = "A senha informada está incorreta.";

  if (e.code == 'user-disabled') {
    alertDialogFailure(context: context, title: null, information: _informationUserDisabled);
  } else if (e.code == 'user-not-found') {
    alertDialogFailure(context: context, title: null, information: _informationUserNotFound);
  } else if (e.code == 'invalid-email') {
    alertDialogFailure(context: context, title: null, information: _informationInvalidEmail);
  } else if (e.code == 'wrong-password') {
    alertDialogFailure(context: context, title: null, information: _informationWrongPassword);
  } else {
    alertDialogFailure(context: context, title: null, information: e.message);
  }
}

void handleFirebaseCreateUserWithEmailAndPasswordException(FirebaseAuthException e,{@required BuildContext context}) {
  final _informationEmailAlreadyInUse = "Já existe uma conta com o endereço de e-mail digitado.";
  final _informationInvalidEmail = "Endereço de e-mail não é válido.";
  final _informationOperationNotAllowed = "Erro no servidor! Entre em contato com o administrador para solução do problema.";
  final _informationWeakPassword = "Senha não é forte o suficiente.";

  if (e.code == 'email-already-in-use') {
    alertDialogFailure(context: context, title: null, information: _informationEmailAlreadyInUse);
  } else if (e.code == 'invalid-email') {
    alertDialogFailure(context: context, title: null, information: _informationInvalidEmail);
  } else if (e.code == 'operation-not-allowed') {
    alertDialogFailure(context: context, title: null, information: _informationOperationNotAllowed);
    //Lançadas se as contas de e-mail/senha não estiverem habilitadas. Habilite contas de e-mail/senha no Console Firebase, na guia Auth.
  } else if (e.code == 'weak-password') {
    alertDialogFailure(context: context, title: null, information: _informationWeakPassword);
  } else {
    alertDialogFailure(context: context, title: null, information: e.message);
  }
}

void handleFirebaseSendPasswordResetEmailException(FirebaseAuthException e,{@required BuildContext context}) {
  final _informationAuthOrEmailInvalid = "Endereço de e-mail inválido.";
  final _informationMissingAndroidPkgName = "Um nome do pacote Android deve ser fornecido se o aplicativo android for necessário para ser instalado.";
  final _informationUrlInvalid = "Url inválida ou inexistente.";
  final _informationMissingIosBundleId = "Erro no servidor! Entre em contato com o desenvolvedor para solução do problema.";
  final _informationUriContinueInvalid = "Url inválido na solicitação de uma nova senha.";
  final _informationUriContinueUnauthorized = "Acesse não autorizado! entre em contato com o desenvolvedor para mais detalhes.";
  final _informationUserNotFound = "não existe usuário correspondente ao endereço de e-mail digitado.";

  if (e.code == 'auth/invalid-email') {
    alertDialogFailure(context: context, title: null, information: _informationAuthOrEmailInvalid);
  } else if (e.code == 'auth/missing-android-pkg-name') {
    alertDialogFailure(context: context, title: null, information: _informationMissingAndroidPkgName);
  } else if (e.code == 'auth/missing-continue-uri') {
    alertDialogFailure(context: context, title: null, information: _informationUrlInvalid);
  } else if (e.code == 'auth/missing-ios-bundle-id') {
    alertDialogFailure(context: context, title: null, information: _informationMissingIosBundleId);
    //'Um ID do pacote do iOS deve ser fornecido se um ID da App Store for fornecido.
  } else if (e.code == 'auth/invalid-continue-uri') {
    alertDialogFailure(context: context, title: null, information: _informationUriContinueInvalid);
  } else if (e.code == 'auth/unauthorized-continue-uri') {
    alertDialogFailure(context: context, title: null, information: _informationUriContinueUnauthorized);
    //'O domínio da URL de continuação não está na lista branca. Lista branca do domínio no console Firebase.
  } else if (e.code == 'auth/user-not-found') {
    alertDialogFailure(context: context, title: null, information: _informationUserNotFound);
  }else{
    alertDialogFailure(context: context, title: null, information: e.message);
  }
}