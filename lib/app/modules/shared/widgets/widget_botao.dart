import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatefulWidget {
  final String descricao;
  final VoidCallback onPressed;
  final bool ativo;

  const WidgetButton({Key? key, required this.descricao, required this.onPressed, required this.ativo}) : super(key: key);

  @override
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.85,
        height: 50,
        child: RaisedButton(
          onPressed: widget.ativo ? widget.onPressed : null,
          color: active,
          elevation: 1,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
          child: Padding(
            padding:
            const EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
            child: Text(widget.descricao, style: TextStyle( fontSize: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

