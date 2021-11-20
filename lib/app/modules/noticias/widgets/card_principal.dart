import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
import 'package:flutter/material.dart';

class CardPrimario extends StatelessWidget {
  final Noticia noticia;
  const CardPrimario({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery. of(context). size. height;
    double width = MediaQuery. of(context). size. width;
    return Container(
      height: height * 0.5,
      width: width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: grey3, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: grey1,
              ),
              SizedBox(width: 10,),
              Text(noticia.categoria, style: kCategoryTitle,)
            ],
          ),
          SizedBox(height: 5),
          Expanded(child: Hero(
            tag: noticia.visualizacoes,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(noticia.imagem),
                    fit: BoxFit.cover
                  )
              ),
            ),
          )
          ),
          SizedBox(height: 10),
          Text(
            noticia.titulo,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kTitleCard,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                noticia.hora_postagem.toString(),
                style: kDetailContent,
              ),
              SizedBox(width: 10,),
              CircleAvatar(
                radius: 5,
                backgroundColor: grey1,
              ),
              SizedBox(width: 10,),
              Text(
                '2 minutos de leitura',
                style: kDetailContent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
