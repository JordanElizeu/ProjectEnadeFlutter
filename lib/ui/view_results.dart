import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/controller/controller_results.dart';

class ViewResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder(
      builder: (ControllerResults controller) {
        return ListView.builder(
            itemCount: controller.map.length,
            itemBuilder: (buildContext, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      ListTile(
                        title: Text(controller.map[index]["nome"]),
                      ),
                      ListTile(
                        title: Text(controller.map[index]["resultado"]),
                      ),
                    ],
                  )
                ],
              );
            });
      },
    ));
  }
}
