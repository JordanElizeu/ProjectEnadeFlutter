import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class ViewQuizMobile extends StatelessWidget {
  const ViewQuizMobile({
    Key key,
    this.image,
    this.title,
    this.titleButton,
    this.function
  }) : super(key: key);

  final Image image;
  final String title;
  final String titleButton;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 150,
                child: ElevatedButton(
                  child: Text(titleButton),
                  onPressed: function,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> fancyCards = [
      ViewQuizMobile(
        title: "Quiz - ADS",
        image: Image.asset("assets/images/ads.png"),
        titleButton: "Iniciar Quiz",
        function: (){ControllerAllMethods().transitionScreen(nameRoute: Routes.QUIZ_ADS, context: context);},
      ),
      ViewQuizMobile(
        title: "Resultados",
        image: Image.asset("assets/images/resultado.png"),
        titleButton: "Mostrar resultados",
        function: (){ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTADOS, context: context);},
      ),
      ViewQuizMobile(
        title: "Quiz - REDES",
        image: Image.asset("assets/images/redes.png"),
        titleButton: "Iniciar Quiz",
        function: (){ControllerAllMethods().transitionScreen(nameRoute: Routes.QUIZ_NETWORK, context: context);},
      ),
    ];
    return StackedCardCarousel(
      items: fancyCards,
    );
  }
}