import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller_initialpage_mobile.dart';

class ViewBodyMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> listImages = [
      'assets/images/enade2021.png',
      'assets/images/card_enade.webp',
      'assets/images/enade_dicas.png',
    ];
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 64.0,bottom: 32.0),
          child: Column(
            children: [
              Container(
                child: CarouselImages(
                  scaleFactor: 0.6,
                  listImages: listImages,
                  height: 250.0,
                  borderRadius: 30.0,
                  cachedNetworkImage: true,
                  verticalAlignment: Alignment.topCenter,
                  onTap: (index){
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Container(
                  height: 40,
                  width: constraints.maxWidth*0.80,
                  child: ElevatedButton(
                    onPressed: () {
                      ControllerInitialPageMobile().initializeQuiz(context);
                      },
                    child: Text("Iniciar simulado"),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
