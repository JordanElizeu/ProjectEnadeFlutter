import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/components/progress.dart';
import 'package:project_enade/controller/controller_results.dart';
import 'package:project_enade/data/firebase.dart';

class ViewResults extends StatelessWidget {
  final _titleError = "Erro desconhecido";

  @override
  Widget build(BuildContext context) {
    getAllResults(context: context);
    return Scaffold(body: Center(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: constraints.maxWidth * 0.50 < 350
                    ? constraints.maxWidth * 0.70
                    : constraints.maxWidth * 0.50,
                height: 100,
                child: Card(
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Candidato(a)",style: TextStyle(fontSize: 17,color: Colors.white),),
                          Text("Disciplina",style: TextStyle(fontSize: 17,color: Colors.white),),
                          Text("Resultado",style: TextStyle(fontSize: 17,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.50 < 350
                    ? constraints.maxWidth * 0.70
                    : constraints.maxWidth * 0.50,
                height: constraints.maxHeight * 0.70,
                child: Card(
                  child: GetBuilder(
                    init: ControllerResults(),
                    builder: (ControllerResults controller) {
                      return Container(
                        child: futureBuilder(context),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  Widget futureBuilder(BuildContext context) {
    return FutureBuilder<Map<dynamic, dynamic>>(
        future: getAllResults(context: context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return alertDialogFailure(
                context: context,
                title: _titleError,
              );
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              return Text("Lost connection");
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final Map<dynamic, dynamic> map = snapshot.data;
                return ListView.builder(
                    itemCount: map.length,
                    itemBuilder: (buildContext, index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(map.values
                                      .toList()[index]["nome"]
                                      .toString()),
                                  Text(map.values
                                      .toList()[index]["disciplina"]
                                      .toString()),
                                  Container(
                                    width: 80,
                                    height: 50,
                                    child: Card(
                                      color: Colors.blue,
                                      child: Center(
                                        child: Text(map.values
                                            .toList()[index]["resultado"]
                                            .toString()+"/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
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
              return Text("Lista vazia");
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
