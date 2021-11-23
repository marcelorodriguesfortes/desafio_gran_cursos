import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetCampo extends StatefulWidget {
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final String labelText;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final String?  errorText;


  const WidgetCampo({Key? key,
    required this.textEditingController,
    this.validator,
    required this.textInputType,
    required this.labelText,
    this.enable,
    this.onChanged,
    this.errorText
  }) : super(key: key);

  @override
  _WidgetCampoState createState() => _WidgetCampoState();
}

class _WidgetCampoState extends State<WidgetCampo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 14.0),
        child: TextFormField(
          enabled: widget.enable != null ? widget.enable : true,
          onChanged: widget.onChanged,
          controller: widget.textEditingController,
          validator: widget.validator,
          obscureText: widget.textInputType == TextInputType.visiblePassword ? true : false,
          keyboardType: widget.textInputType,
          decoration: new InputDecoration(
            errorText: widget.errorText == null ? null : widget.errorText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                  color: dark,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: dark,
                width: 0.5,
              ),
            ),
            labelStyle: TextStyle(color: Colors.black38),
            border: OutlineInputBorder(),
            labelText: widget.labelText,
            counterStyle: TextStyle(
                fontSize: 15,
                color: Colors.black45
            ),
          ),
        ),
      );

  }
}
