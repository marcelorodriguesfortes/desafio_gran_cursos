import 'package:flutter/material.dart';

class WidgetAlertDialog extends StatefulWidget {
  final String titulo;
  final String pergunta;
  final VoidCallback? onPressed;
  const WidgetAlertDialog({Key? key, required this.titulo, required this.pergunta, this.onPressed}) : super(key: key);

  @override
  _WidgetAlertDialogState createState() => _WidgetAlertDialogState();
}

class _WidgetAlertDialogState extends State<WidgetAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo),
      content: Text(widget.pergunta),
      actions: <Widget>[
        FlatButton(
          child: Text('Sim'),
          onPressed: widget.onPressed
        ),

        FlatButton(
          child: Text('Cancelar'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
