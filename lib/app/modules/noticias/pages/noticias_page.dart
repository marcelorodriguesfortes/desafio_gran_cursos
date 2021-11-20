import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_esporte.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_populares.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_recentes.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_saude.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/noticias_store.dart';
import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  final String title;
  const NoticiasPage({Key? key, this.title = 'NoticiasPage'}) : super(key: key);
  @override
  NoticiasPageState createState() => NoticiasPageState();
}
class NoticiasPageState extends State<NoticiasPage> {
  final NoticiasStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            ListTile(
              title: Text("BEM-VINDO(A)", textAlign: TextAlign.end, style: kNonActiveTabStyle,),
              subtitle: Text("Maisa Medeiros", textAlign: TextAlign.end, style: kActiveTabStyle,),
              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/ve.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: DefaultTabController(
                length: 4,  // Added
                initialIndex: 0, //
                child: TabBar(
                    labelColor: Colors.black54,
                    unselectedLabelColor: kGrey1,
                    unselectedLabelStyle: kNonActiveTabStyle,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelStyle: kActiveTabStyle.copyWith(fontSize: 25),
                    tabs: [
                      Tab(text: 'Populares',),
                      Tab(text: 'Esporte',),
                      Tab(text: 'Saúde',),
                      Tab(text: 'Recentes',),
                    ]
                ),

              ),
            )

          ],
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: TabBarView(
          children: [
            TabNoticiasRecentes(),
            TabNoticiasEsporte(),
            TabNoticiasSaude(),
            TabNoticiasPopulares(),
          ],
        ),
      )
    );
  }
}