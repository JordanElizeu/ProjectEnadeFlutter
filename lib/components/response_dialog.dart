import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Color colorIcon;

  ResponseDialog({
    this.title = "",
    this.message = "",
    this.icon,
    this.buttonText = 'OK',
    this.colorIcon = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(buttonText),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  SuccessDialog(
    this.message,
    this.title, {
    this.icon = Icons.done,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  FailureDialog(
    this.message,
    this.title,{
    this.icon = Icons.warning,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.red,
    );
  }
}

alertDialogSuccess({@required BuildContext context,@required information, @required title}) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return SuccessDialog(information, title);
      });
}

alertDialogFailure({@required BuildContext context, @required information, @required title}) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return FailureDialog(information, title == null? "Algo falhou!": title);
      });
}
