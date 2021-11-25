import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/components/progress.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/controller/controller_results.dart';
import 'package:project_enade/data/firebase.dart';
import 'package:project_enade/router/Router.dart';

class ViewResults extends StatelessWidget {
  final _titleError = "Erro desconhecido";

  @override
  Widget build(BuildContext context) {
    getAllResults(context: context);
    return WillPopScope(
      onWillPop: () =>
      ControllerAllMethods()
          .transitionScreen(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: Scaffold(body: Center(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth * 0.80 < 350
                    ? constraints.maxWidth * 0.90
                    : constraints.maxWidth * 0.80,
                height: constraints.maxHeight*0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
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
                    Container(
                      child: GetBuilder(
                        init: ControllerResults(),
                        builder: (ControllerResults controller) {
                          return Container(
                            child: futureBuilder(context,constraints),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }

  Widget futureBuilder(BuildContext context,constraints) {
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
              return ShowProgress();
              break;
            case ConnectionState.active:
              return emptyList(constraints);
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final Map<dynamic, dynamic> map = snapshot.data;
                if(map.length > 1) {
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
                                              .toString() + "/10",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),),
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

Widget emptyList(constraints){
  return Material(
    elevation: 8,
    child: Container(
      alignment: Alignment.center,
      height: constraints.maxHeight*0.50,
      width: constraints.maxWidth*0.50,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning,color: Colors.white,size: 50,),
          Text("0 Resultados",style: TextStyle(fontSize: 24,color: Colors.white),)
        ],
      ),
    ),
  );
}
