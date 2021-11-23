import 'package:desafio_gran_cursos/app/modules/noticias/constants/fonts.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetStatus extends StatelessWidget {
  final IconData icone;
  final String total;
  const WidgetStatus({Key? key, required this.icone, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icone, color: grey2),
        SizedBox(width: 4),
        Text(total, style: detalheConteudo,)
      ],
    );
  }
}
