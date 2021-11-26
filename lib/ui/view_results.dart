import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/components/progress.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/data/firebase.dart';
import 'package:project_enade/router/Router.dart';

class ViewResults extends StatelessWidget {
  final _titleError = "Erro desconhecido";

  @override
  Widget build(BuildContext context) {
    getAllValuesResultsToListResults(context: context);
    return WillPopScope(
      onWillPop: () =>
          ControllerAllMethods()
              .transitionScreen(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: Scaffold(body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.blue,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Candidato(a)",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              "Disciplina",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              "Resultado",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(child: futureBuilder(context, constraints))
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  Widget futureBuilder(BuildContext context, constraints) {
    return FutureBuilder<Map<dynamic, dynamic>>(
        future: getAllValuesResultsToListResults(context: context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return alertDialogFailure(
                context: context,
                title: _titleError,
              );
              break;
            case ConnectionState.waiting:
              return ShowProgress();
              break;
            case ConnectionState.active:
              return emptyList(constraints);
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final Map<dynamic, dynamic> _map = snapshot.data;
                // 0 é o comprimento do mapa que vem do firebase, caso for 0 quer dizer que não tem nada
                if (_map.length > 0 || _map != null) {
                  return ListView.builder(
                      itemCount: _map.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (buildContext, index) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_map.values
                                        .toList()[index]["nome"]
                                        .toString()),
                                    Text(_map.values
                                        .toList()[index]["disciplina"]
                                        .toString()),
                                    Container(
                                      width: 80,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          _map.values
                                                  .toList()[index]["resultado"]
                                                  .toString() +
                                              ".0",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
                return emptyList(constraints);
              }
              return emptyList(constraints);
              break;
            default:
              return alertDialogFailure(
                context: context,
                title: _titleError,
              );
          }
        });
  }
}

Widget emptyList(constraints) {
  return Material(
    elevation: 10,
    child: Padding(
      padding: const EdgeInsets.all(64.0),
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        height: constraints.maxHeight * 0.50,
        width: constraints.maxWidth * 0.50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.warning,
                color: Colors.white,
                size: 70,
              ),
            ),
            Text(
              "0 Resultados",
              style: TextStyle(fontSize: 24, color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}
