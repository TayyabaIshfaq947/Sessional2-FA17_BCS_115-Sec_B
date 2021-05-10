import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class customDialog extends StatelessWidget {
  final title;
  final content;
  final actiontext;
  final VoidCallback callback;
  customDialog(this.callback, this.title, this.content,
      [this.actiontext = "Ok"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.tealAccent,
      title: new Text(title),
      content: new Text(content),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.red,
          child: Text(actiontext),
        )
      ],
    );
  }
}
