import 'package:desafio_gran_cursos/app/modules/noticias/widgets/card_secundario.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/card_principal.dart';


class TabNoticiasRecentes extends StatelessWidget {
  const TabNoticiasRecentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery. of(context). size. height;

    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.5,
            padding: EdgeInsets.only(left: 18),
            child: ListView.builder(
                itemCount: recentList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  var noticias = recentList[index];

                  return InkWell(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: CardPrimario(noticia: noticias,),
                    ),
                  );
                }
            ),
          ),
          SizedBox(height: 25,),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:  18.0),
              child: Text('Baseado no seu histórico de leitura', style: kTitleSectionCard),
            ),
          ),
          Container(
            height: height * 0.5,
            child: ListView.builder(
                    itemCount: recentList.length,
                    itemBuilder: (context, index){
                    var noticiasPersonalizadas = trendingList[index];
                    return InkWell(
                      onTap: (){},
                      child: Container(
                        width: double.infinity,
                        height: height * 0.2,
                        margin: EdgeInsets.symmetric(horizontal:  18, vertical: 8),
                        child: CardSecundario(noticia: noticiasPersonalizadas)
                      ),
                    );
                  }
                  ),
          ),
        ],
      ),
    );
  }
}

