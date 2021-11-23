import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetBotaoCircular extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;
  const WidgetBotaoCircular({Key? key, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            icon,
            color: grey2,
            size: 15
          ),
        ),
      )
    );
  }
}


