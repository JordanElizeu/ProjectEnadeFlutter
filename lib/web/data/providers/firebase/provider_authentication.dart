import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/controller/generic_controller/controller_firebase.dart';
import 'package:project_enade/web/controller/login_controller/controller_login.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/data/providers/firebase/provider_exceptions.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';

class ProviderAuthentication {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _titleFailureAccessAccount = "Erro desconhecido";

  void addNewUser(
      {email,
      password,
      name,
      BuildContext context}) async {
    final _titleSuccessCreateNewUser = "Usuário criado com sucesso";
    final _informationSuccessCreateNewUser =
        "Enviamos um e-mail contendo informações de acesso ao Enade!"
        "\n\nCaso não tenha recebido, verifique caixa spam e lixeira";
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _databaseReference
          .child("Database")
          .child("Users")
          .child(_auth.currentUser.uid)
          .child("nome")
          .set(name);
      _databaseReference
          .child("Database")
          .child("Users")
          .child(_auth.currentUser.uid)
          .child("matricula")
          .set(ControllerFirebase().getUuid());
      _databaseReference
          .child("Database")
          .child("Users")
          .child(_auth.currentUser.uid)
          .child("id")
          .set(_auth.currentUser.uid);
      try {
        await _auth.sendPasswordResetEmail(email: email);
        alertDialogSuccess(
            title: _titleSuccessCreateNewUser,
            information: _informationSuccessCreateNewUser,
            function: () {
              ControllerAllMethods().pageTransition(
                  nameRoute: Routes.INITIAL, context: context);
              Navigator.pop(ControllerLogin.contextControllerLogin);
            },
            context: context);
      } on FirebaseAuthException catch (exception) {
        ProviderExceptions().handleFirebaseSendPasswordResetEmailException(
            context: context, exceptionMessage: exception);
      }
    } on FirebaseAuthException catch (exception) {
      ProviderExceptions().handleFirebaseCreateUserWithEmailAndPasswordException(
          context: context, exceptionMessage: exception);
    }
  }

  Future<Map<dynamic, dynamic>> getUser(
      {@required BuildContext context}) async {
    Map<dynamic, dynamic> _map;
    try {
      await FirebaseDatabase.instance
          .reference()
          .child("Database")
          .child("Users")
          .child(_auth.currentUser.uid)
          .once()
          .then((DataSnapshot snapshot) => {_map = snapshot.value});
      return _map;
    } on DatabaseError catch (exception) {
      alertDialogFailure(
        context: context,
        title: _titleFailureAccessAccount,
        information: exception,
      );
      return null;
    }
  }

  void loginAccount({email, matricula, password, BuildContext context}) async {
    final _titleButtonFailureEmailNotVerified = "Solicitar verificação";
    final _informationSendVerificationToEmail =
        "Enviamos um novo e-mail de verificação para você";
    final _titleSendVerificationToEmail = "E-mail enviado!";
    final _titleButtonSendVerificationToEmail = "Obrigado, irei verificar";
    final _titleFailureAccessAccountEmailNotVerified = "E-mail não verificado!";
    final _informationLoginIsSuccess = "Bem vindo ao Enade 2021!\n\nAgora "
        "os questionários estão disponíveis para você!";
    final _textButtonLoginIsSuccess = "Iniciar os questionários";
    final _informationFailureAccessAccountEmailNotVerified =
        "Confirme seu e-mail para conseguir logar na sua conta";
    Map<dynamic, dynamic> map;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_emailIsVerified()) {
        try {
          await FirebaseDatabase.instance
              .reference()
              .child("Database")
              .child("Users")
              .child(_auth.currentUser.uid)
              .once()
              .then((DataSnapshot snapshot) => {map = snapshot.value});
          final _titleLoginIsSuccess = "Olá, ${map["nome"].toString()}";

          alertDialogSuccess(
              title: _titleLoginIsSuccess,
              context: context,
              information: _informationLoginIsSuccess,
              nameButton: _textButtonLoginIsSuccess,
              function: () {
                ControllerAllMethods().pageTransition(
                    nameRoute: Routes.INITIAL, context: context);
                Navigator.pop(ControllerLogin.contextControllerLogin);
              });
        } on DatabaseError catch (exception) {
          alertDialogFailure(
            context: context,
            title: _titleFailureAccessAccount,
            information: exception,
          );
        }
      } else {
        alertDialogFailure(
            context: context,
            title: _titleFailureAccessAccountEmailNotVerified,
            information: _informationFailureAccessAccountEmailNotVerified,
            nameButton: _titleButtonFailureEmailNotVerified,
            function: () async {
              try {
                Navigator.pop(ControllerLogin.contextControllerLogin);
                User user = _auth.currentUser;
                await user.sendEmailVerification();
                alertDialogSuccess(
                    title: _titleSendVerificationToEmail,
                    context: context,
                    information: _informationSendVerificationToEmail,
                    nameButton: _titleButtonSendVerificationToEmail);
              } on FirebaseAuthException catch (exception) {
                ProviderExceptions().handleFirebaseSendPasswordResetEmailException(
                    context: context, exceptionMessage: exception);
              }
            });
      }
    } on FirebaseAuthException catch (exception) {
      ProviderExceptions().handleFirebaseLoginWithCredentialsException(
          context: context, exceptionMessage: exception);
    }
  }

  bool _emailIsVerified() {
    User user = _auth.currentUser;
    return user.emailVerified;
  }
}
