import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_card_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../noticias_store.dart';

class TabNoticiasRecentes extends StatelessWidget {
  TabNoticiasRecentes({Key? key}) : super(key: key);
  final NoticiasStore store = Modular.get();
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
                    var noticia = popularList[index];
                    return InkWell(
                      onTap: (){
                        store.noticia = noticia;
                        Modular.to.pushNamed('/detalhenoticia');
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: WidgetCardPrimario(noticia: noticia,),
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
