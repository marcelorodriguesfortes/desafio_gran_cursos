import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_card_secundario.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/models/noticia.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_card_principal.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../noticias_store.dart';


class TabNoticiasPopulares extends StatelessWidget {
  TabNoticiasPopulares({Key? key}) : super(key: key);

  final NoticiasStore store = Modular.get();

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
                itemCount: noticiasRecentes.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  var noticia = noticiasRecentes[index];

                  return InkWell(
                    onTap: (){
                      store.noticia = noticia;
                      Modular.to.pushNamed('/detalhenoticia');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: WidgetCardPrimario(noticia: noticia),
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
              child: Text('Baseado no seu histórico de leitura', style: tituloSecaoCard),
            ),
          ),
          Container(
            height: height * 0.5,
            child: ListView.builder(
                    itemCount: noticiasRecentes.length,
                    itemBuilder: (context, index){
                    var noticiasPersonalizadas = noticiasPopulares[index];
                    return InkWell(
                      onTap: (){
                        store.noticia = noticiasPersonalizadas;
                        Modular.to.pushNamed('/detalhenoticia');
                      },
                      child: Container(
                        width: double.infinity,
                        height: height * 0.2,
                        margin: EdgeInsets.symmetric(horizontal:  18, vertical: 8),
                        child: WidgetCardSecundario(noticia: noticiasPersonalizadas)
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

