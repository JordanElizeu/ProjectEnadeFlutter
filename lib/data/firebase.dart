import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/controller/controller_firebase.dart';
import 'package:project_enade/data/exceptions.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

final _informationSuccessCreateNewUser = "Enviamos um e-mail contendo informações de acesso ao Enade!\n\nCaso não tenha recebido, verifique caixa spam e lixeira";
final _titleSuccessCreateNewUser = "Usuário criado com Sucesso";
final _informationFailureAccessAccount = "Conta inexistente.";
final _titleFailureAccessAccount = "Erro desconhecido";
final _informationSuccessAddNewResult = "Quiz concluído com sucesso!";

void createNewUser({@required email, @required password, @required name, @required BuildContext context}) async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    _databaseReference.child("Database").child("Users").child(_auth.currentUser.uid).child("nome").set(name);
    _databaseReference.child("Database").child("Users").child(_auth.currentUser.uid).child("matricula").set(ControllerFirebase().getUuid());
    _databaseReference.child("Database").child("Users").child(_auth.currentUser.uid).child("senha").set(password);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      alertDialogSuccess(title: _titleSuccessCreateNewUser, information: _informationSuccessCreateNewUser, context: context);
    } on FirebaseAuthException catch (exception) {
      handleFirebaseSendPasswordResetEmailException(exception, context: context);
    }
  } on FirebaseAuthException catch(exception) {
    handleFirebaseCreateUserWithEmailAndPasswordException(exception, context: context);
  }
}

void accessAccountEnade({@required matricula, @required password, @required BuildContext context}) async {
  List<String> list = [];
  if(_auth.currentUser != null) {
    try {
      await FirebaseDatabase.instance.reference().child("Database").child(
          "Users").child(_auth.currentUser.uid).once().then((
          DataSnapshot snapshot) =>
      {
        list.add(snapshot.value.toString()),
        print(list),
      });
    } on DatabaseError catch (exception) {
        alertDialogFailure(context: context, title: _titleFailureAccessAccount, information: exception);
    }
  }else{
    alertDialogFailure(context: context, title: null, information: _informationFailureAccessAccount);
  }
}

void addNewResult({@required email, @required password, @required result, @required BuildContext context}) async{
  try{
    List<String> name = [];
    await FirebaseDatabase.instance.reference().child("Database").child("Users").child(_auth.currentUser.uid).child("nome").once().then((DataSnapshot snapshot) => {
      name.add(snapshot.value)
    });
    FirebaseDatabase.instance.reference().child("Database").child("Resultados").child(_auth.currentUser.uid).child(email).set(name[0]);
    _databaseReference.child("Database").child("Resultados").child(_auth.currentUser.uid).child("email").child(result);
    alertDialogSuccess(title: "Quiz 2021 $result Acertos de 10", context: context, information: _informationSuccessAddNewResult);
  } on DatabaseError catch (exception){
    alertDialogFailure(context: context, title: _titleFailureAccessAccount, information: exception);
  }
}

Future<List<String>> getAllResults({@required BuildContext context}) async{
  try{
    List<String> list = [];
   await FirebaseDatabase.instance.reference().child("Database").child("Resultados").once().then((DataSnapshot snapshot) => {
     list.add(snapshot.value.toString()),
     print(list),
   });
   return list;
  } on DatabaseError catch (exception){
    alertDialogFailure(context: context, title: _titleFailureAccessAccount, information: exception);
    return [];
  }
}