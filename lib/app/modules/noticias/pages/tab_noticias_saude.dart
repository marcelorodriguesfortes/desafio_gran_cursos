import 'package:flutter/material.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_card.dart';


class TabNoticiasSaude extends StatelessWidget {
  const TabNoticiasSaude({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.only(left: 18),
            child: ListView.builder(
                itemCount: popularList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  var noticias = popularList[index];

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

