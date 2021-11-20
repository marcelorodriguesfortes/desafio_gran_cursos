import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_populares.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_recentes.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/drawer_item.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_app_bar.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/widget_alert_dialog.dart';
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
  final SharedStore sharedStore = Modular.get();

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: sharedStore.usuario != null ? sharedStore.usuario!.urlFoto != null ?
            CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: SizedBox(
                    width: 180,
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl: sharedStore.usuario!.urlFoto!,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                ),
              ),
            ) :
            CircleAvatar(
              backgroundColor: Colors.white54,
              child: Text('F',style: TextStyle(color: Colors.black87)),
            ) :
            CircleAvatar(
              backgroundColor: Colors.white54,
              child: Text('F',style: TextStyle(color: Colors.black87)),
            ),
            accountName: sharedStore.usuario != null ? Text(sharedStore.usuario!.nome.toString(), style: TextStyle(fontSize: 20, color: Colors.white),) : GestureDetector(
              onTap: () {
                Modular.to.pushNamed('/login');
              },
              child: Text("Fazer login", style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
            accountEmail: sharedStore.usuario != null ? Text(sharedStore.usuario!.email!, style: TextStyle(fontSize: 16, color: Colors.white),) : Container(height: 1,),
          ),

          DrawerItem(
            'Eventos',
            Icons.calendar_today,
                (){
                  if(sharedStore.usuario != null)
                    Modular.to.pushNamed('/meusdados');
                  else{
                    showDialog(
                        context: context,
                        builder: (context) =>
                            WidgetAlertDialog(
                                onPressed: () {
                                  Modular.to.pushNamed('/login');
                                },
                                titulo: 'Atenção',
                                pergunta: 'Você não fez login. Deseja se autenticar?'
                            )
                    );
                  }
            },
          ),
          DrawerItem(
            'Perfil',
            Icons.person_outline_outlined,
                (){
              if(sharedStore.usuario != null)
                Modular.to.pushNamed('/meusdados');
              else{
                showDialog(
                    context: context,
                    builder: (context) =>
                        WidgetAlertDialog(
                            onPressed: () {
                              Modular.to.pushNamed('/login/cliente');
                            },
                            titulo: 'Atenção',
                            pergunta: 'Você não fez login. Deseja se autenticar?'
                        )
                );
              }
            },
          ),
          sharedStore.usuario != null ? DrawerItem(
            'Sair',
            Icons.exit_to_app,
                (){
              showDialog(
                  context: context,
                  builder: (context) =>
                      WidgetAlertDialog(
                          onPressed: () {
                            sharedStore.logout();
                            Modular.to.popUntil(ModalRoute.withName('/'));
                          },
                          titulo: 'Atenção',
                          pergunta: 'Tem certeza que deseja realizar logout?'
                      )
              );
            },
          ) :
          DrawerItem(
            'Fazer login',
            Icons.login,
                (){Modular.to.pushNamed('/login');},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          drawer: _buildDrawer(),
          appBar: WidgetAppBar(),
          body: TabBarView(
            children: [
              TabNoticiasRecentes(),
              TabNoticiasPopulares(),
            ],
          ),

        ),
      ),
    );
  }
}