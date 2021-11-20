import 'package:flutter/material.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_card.dart';


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
                      child: WidgetCard(noticia: noticias,),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

