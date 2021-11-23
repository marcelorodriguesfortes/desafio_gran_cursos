import 'package:desafio_gran_cursos/app/modules/noticias/constants/fonts.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_botao_circular.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_status.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../noticias_store.dart';

class DetalheNoticiaPage extends StatefulWidget {
  const DetalheNoticiaPage({Key? key}) : super(key: key);

  @override
  _DetalheNoticiaPageState createState() => _DetalheNoticiaPageState();
}

class _DetalheNoticiaPageState extends State<DetalheNoticiaPage> {
  final NoticiasStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: ListView(
              children: [
                SizedBox(height: 12),
                Hero(
                  tag: store.noticia!.visualizacoes,
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(store.noticia!.imagem),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 15
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: grey3, width: 1.0),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: grey3,
                          ),
                          SizedBox(width: 6),
                          Text(
                            store.noticia!.categoria,
                            style: tituloCategoria,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    WidgetStatus(
                      icone: Icons.remove_red_eye,
                      total: store.noticia!.visualizacoes,
                    ),
                    SizedBox(width: 15),
                    WidgetStatus(
                      icone: Icons.favorite_border,
                      total: store.noticia!.favorito,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(store.noticia!.titulo, style: tituloCard.copyWith(fontSize: 20)),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(store.noticia!.hora_postagem, style: detalheConteudo),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 15,
                      child: Divider(
                        color: dark,
                        height: 1,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(store.noticia!.autor, style: detalheConteudo.copyWith(color: dark)),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                    store.noticia!.conteudo,
                    style: nonActiveTabStyle.copyWith(
                      height: 2,
                      fontWeight: FontWeight.w400
                    )
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        );
      },
    );
  }
}
