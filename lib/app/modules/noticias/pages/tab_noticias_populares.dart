import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/card_principal.dart';
import 'package:flutter/material.dart';

class TabNoticiasPopulares extends StatelessWidget {
  const TabNoticiasPopulares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery. of(context). size. height;
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.7,
            padding: EdgeInsets.only(left: 18),
            child: ListView.builder(
                itemCount: popularList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index){
                    var noticias = popularList[index];

                    return InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: CardPrimario(noticia: noticias,),
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
