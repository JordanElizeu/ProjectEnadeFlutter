import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller_login.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Color colorIcon;
  final Function functionButton;

  ResponseDialog({
    this.title = "",
    this.message = "",
    this.icon,
    this.buttonText = 'OK',
    this.colorIcon = Colors.black,
    @required this.functionButton,
  });

  @override
  Widget build(BuildContext context) {
    ControllerLogin.contextControllerLogin = context;
    return AlertDialog(
      title: Visibility(
        child: Text(title),
        visible: title.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(
                icon,
                size: 64,
                color: colorIcon,
              ),
            ),
            visible: icon != null,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: ListTile(
                  title: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(buttonText),
            ),
            onPressed: functionButton == null? (){Navigator.pop(context);}:functionButton
            )
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Function functionButton;



  SuccessDialog(
    this.message,
    this.title, {
    this.buttonText,
    this.icon = Icons.cloud_done,
    this.functionButton,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      buttonText: buttonText == null ? "Ok" : buttonText,
      colorIcon: Colors.green,
      functionButton: functionButton,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Function functionButton;

  FailureDialog(
    this.message,
    this.title, {
    this.buttonText,
    this.icon = Icons.cloud_off,
    this.functionButton,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      buttonText: buttonText == null ? "Ok" : buttonText,
      colorIcon: Colors.red,
      functionButton: functionButton,
    );
  }
}

alertDialogSuccess(
    {@required BuildContext context,
    information,
    title,
    nameButton,
    Function function}) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return SuccessDialog(
          information,
          title == null ? "Algo falhou!" : title,
          buttonText: nameButton,
          functionButton: function,
        );
      });
}

alertDialogFailure(
    {@required BuildContext context,
    information,
    title,
    nameButton,
    Function function}) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return FailureDialog(
          information,
          title == null ? "Algo falhou!" : title,
          buttonText: nameButton,
          functionButton: function,
        );
      });
}
