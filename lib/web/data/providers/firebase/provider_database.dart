import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';

class ProviderDatabase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  final _titleFailureAccessAccount = "Erro desconhecido";

  Future<void> addNewResult(
      {result, name, BuildContext context, disciplina}) async {
    try {
      final Map<dynamic, dynamic> _map =
          await getAllResults(context: context);
      int _quantityResultsInFirebase;
      _map != null
          ? _quantityResultsInFirebase = _map.length + 1
          : _quantityResultsInFirebase = 1;
      FirebaseDatabase.instance
          .reference()
          .child("Database")
          .child("Resultados")
          .child(_auth.currentUser.uid)
          .child(
              "${_auth.currentUser.uid + _quantityResultsInFirebase.toString()}")
          .child("nome")
          .set(name);
      _databaseReference
          .child("Database")
          .child("Resultados")
          .child(_auth.currentUser.uid)
          .child(
              "${_auth.currentUser.uid + _quantityResultsInFirebase.toString()}")
          .child("resultado")
          .set(result);
      _databaseReference
          .child("Database")
          .child("Resultados")
          .child(_auth.currentUser.uid)
          .child(
              "${_auth.currentUser.uid + _quantityResultsInFirebase.toString()}")
          .child("disciplina")
          .set(disciplina);
      _databaseReference
          .child("Database")
          .child("Resultados")
          .child(_auth.currentUser.uid)
          .child(
              "${_auth.currentUser.uid + _quantityResultsInFirebase.toString()}")
          .child("id")
          .set(_quantityResultsInFirebase.toString());
    } on DatabaseError catch (exception) {
      alertDialogFailure(
          context: context,
          title: _titleFailureAccessAccount,
          information: exception);
    }
  }

  void showFinishResult({email, password, result, BuildContext context}) async {
    final _informationSuccessAddNewResult = "Quiz concluído com sucesso!";
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
    Map<dynamic, dynamic> _map;
    try {
      await FirebaseDatabase.instance
          .reference()
          .child("Database")
          .child("Resultados")
          .child(_auth.currentUser.uid)
          .once()
          .then((DataSnapshot snapshot) => {
        snapshot.exists?
        _map = snapshot.value:
        _map = null
      });
      return _map;
    } on DatabaseError catch (exception) {
      alertDialogFailure(
          context: context,
          title: _titleFailureAccessAccount,
          information: exception);
      return {};
    }
  }
}
