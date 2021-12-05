import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/controller/controller_initialpage_mobile.dart';

class ViewBodyMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _textButtonInitQuiz = "Iniciar simulado";
    final List<String> _listImages = [
      'assets/images/enade2021.png',
      'assets/images/card_enade.webp',
      'assets/images/enade_dicas.png',
    ];
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: constraints.maxWidth*0.80,
                  child:
                      Text("Exame Nacional de Desempenho dos Estudantes (Enade)",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                ),
              ),
              Container(
                child: CarouselImages(
                  scaleFactor: 0.6,
                  listImages: _listImages,
                  height: 250.0,
                  borderRadius: 30.0,
                  cachedNetworkImage: true,
                  verticalAlignment: Alignment.topCenter,
                  onTap: (index) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Container(
                  height: 40,
                  width: constraints.maxWidth * 0.80,
                  child: ElevatedButton(
                    onPressed: () {
                      ControllerInitialPageMobile().initializeQuiz(context);
                    },
                    child: Text(_textButtonInitQuiz),
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
