import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
import 'package:flutter/material.dart';

class CardSecundario extends StatelessWidget {
  final Noticia noticia;
  const CardSecundario({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: grey3, width: 1)
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: NetworkImage(noticia.imagem), fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 12,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noticia.titulo.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: kTitleCard,
                ),

                SizedBox(height: 4,),

                Text(
                  noticia.subtitulo.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: kDetailContent,
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
          ))
        ],
      ),

    );
  }
}
