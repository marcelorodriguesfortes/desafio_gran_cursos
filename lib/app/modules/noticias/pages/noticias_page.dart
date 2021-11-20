import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_populares.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_recentes.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
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
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
            elevation: 4,
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
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
                      Tab(text: 'Recentes',),
                    ]
                ),
              )

            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabNoticiasRecentes(),
            TabNoticiasPopulares(),
          ],
        ),

      ),
    );
  }
}