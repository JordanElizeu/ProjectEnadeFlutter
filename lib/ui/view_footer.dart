import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150.0,
          color: Color(0xFF071d41),
          child: Column(
            children: [
              _formatText("gov.com"),
              _formatText(
                  "Esse site não possui nenhum tipo de convênio com o Instituto Exame Nacional de Desempenho de Estudantes - ENADE. Esse projeto foi desenvolvido"
                  "apenas com o intuito de aprendizado."),
            ],
          ),
        ),
        Container(
          height: 100.0,
          color: Color(0xFF04132a),
          child: Center(
              child: _formatText("Site desenvolvido por Jordan Elizeu")),
        )
      ],
    );
  }
}

Widget _formatText(text) {
  return LayoutBuilder(
      builder: (_, constraints){
        return Container(
          width: constraints.maxWidth*0.7,
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        );
      }
  );
}
