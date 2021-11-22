import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/controller/controller_firebase.dart';
import 'package:project_enade/controller/controller_login.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/data/exceptions.dart';
import 'package:project_enade/router/Router.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final DatabaseReference _databaseReference =
    FirebaseDatabase.instance.reference();

final _informationSuccessCreateNewUser =
    "Enviamos um e-mail contendo informações de acesso ao Enade!\n\nCaso não tenha recebido, verifique caixa spam e lixeira";
final _titleSuccessCreateNewUser = "Usuário criado com Sucesso";
final _titleFailureAccessAccount = "Erro desconhecido";
final _titleFailureAccessAccountEmailNotVerified = "E-mail não verificado!";
final _informationFailureAccessAccountEmailNotVerified =
    "Confirme seu e-mail para conseguir logar na sua conta";
final _informationSuccessAddNewResult = "Quiz concluído com sucesso!";
final _titleButtonFailureEmailNotVerified = "Solicitar verificação";
final _informationSendVerificationToEmail =
    "Enviamos um novo e-mail de verificação para você";
final _titleSendVerificationToEmail = "E-mail enviado!";
final _titleButtonSendVerificationToEmail = "Obrigado, irei verificar";

void createNewUser(
    {@required email,
    @required password,
    @required name,
    @required BuildContext context}) async {
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
    try {
      await _auth.sendPasswordResetEmail(email: email);
      alertDialogSuccess(
          title: _titleSuccessCreateNewUser,
          information: _informationSuccessCreateNewUser,
          context: context);
    } on FirebaseAuthException catch (exception) {
      handleFirebaseSendPasswordResetEmailException(
          context: context, exceptionMessage: exception);
    }
  } on FirebaseAuthException catch (exception) {
    handleFirebaseCreateUserWithEmailAndPasswordException(
        context: context, exceptionMessage: exception);
  }
}

void addNewResultInDatabase(
    {@required result, @required name, @required BuildContext context}) {
  try {
    FirebaseDatabase.instance
        .reference()
        .child("Database")
        .child("Resultados")
        .child(_auth.currentUser.uid)
        .child("nome")
        .set(name);
    _databaseReference
        .child("Database")
        .child("Resultados")
        .child(_auth.currentUser.uid)
        .child("resultado")
        .set(result);
  } on DatabaseError catch (exception) {
    alertDialogFailure(
        context: context,
        title: _titleFailureAccessAccount,
        information: exception);
  }
}

Future<Map<dynamic, dynamic>> getInformationOfUserOn(
    BuildContext context) async {
  Map<dynamic, dynamic> map;
  try {
    await FirebaseDatabase.instance
        .reference()
        .child("Database")
        .child("Users")
        .child(_auth.currentUser.uid)
        .once()
        .then((DataSnapshot snapshot) => {
              map = snapshot.value,
            });
    return map;
  } on DatabaseError catch (exception) {
    alertDialogFailure(
      context: context,
      title: _titleFailureAccessAccount,
      information: exception,
    );
    return null;
  }
}

void accessAccountEnade(
    {@required email,
    @required matricula,
    @required password,
    @required BuildContext context}) async {
  Map<dynamic, dynamic> map;
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    if (emailIsVerified()) {
      try {
        await FirebaseDatabase.instance
            .reference()
            .child("Database")
            .child("Users")
            .child(_auth.currentUser.uid)
            .once()
            .then((DataSnapshot snapshot) => {map = snapshot.value});
        final _titleLoginIsSuccess = "Olá, ${map["nome"].toString()}";
        final _informationLoginIsSuccess =
            "Bem vindo ao Enade 2021!\n\nAgora os questionários estão disponíveis para você!";
        final _textButtonLoginIsSuccess = "Iniciar os questionários";

        alertDialogSuccess(
            title: _titleLoginIsSuccess,
            context: context,
            information: _informationLoginIsSuccess,
            nameButton: _textButtonLoginIsSuccess,
            function: () {
              ControllerAllMethods().transitionScreen(
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
              handleFirebaseSendPasswordResetEmailException(
                  context: context, exceptionMessage: exception);
            }
          });
    }
  } on FirebaseAuthException catch (exception) {
    handleFirebaseLoginWithCredentialsException(
        context: context, exceptionMessage: exception);
  }
}

bool emailIsVerified() {
  User user = _auth.currentUser;
  return user.emailVerified;
}

void getResultQuizAndShowDialog(
    {@required email,
    @required password,
    @required result,
    @required BuildContext context}) async {
  try {
    List<String> name = [];
    await FirebaseDatabase.instance
        .reference()
        .child("Database")
        .child("Users")
        .child(_auth.currentUser.uid)
        .child("nome")
        .once()
        .then((DataSnapshot snapshot) => {name.add(snapshot.value)});
    alertDialogSuccess(
        title: "Quiz 2021 $result Acertos de 10",
        context: context,
        information: _informationSuccessAddNewResult);
  } on DatabaseError catch (exception) {
    alertDialogFailure(
        context: context,
        title: _titleFailureAccessAccount,
        information: exception);
  }
}

Future<Map<dynamic, dynamic>> getAllResults(
    {@required BuildContext context}) async {
  try {
    Map<dynamic, dynamic> _map;
    await FirebaseDatabase.instance
        .reference()
        .child("Database")
        .child("Resultados")
        .once()
        .then((DataSnapshot snapshot) => {
              _map = snapshot.value,
            });
    return _map;
  } on DatabaseError catch (exception) {
    alertDialogFailure(
        context: context,
        title: _titleFailureAccessAccount,
        information: exception);
    return null;
  }
}
