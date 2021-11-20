import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_populares.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/tab_noticias_recentes.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/widgets/widget_app_bar.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/custom_text.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/widget_alert_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/noticias_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticiasPage extends StatefulWidget {
  final String title;
  const NoticiasPage({Key? key, this.title = 'NoticiasPage'}) : super(key: key);
  @override
  NoticiasPageState createState() => NoticiasPageState();
}
class NoticiasPageState extends State<NoticiasPage> {
  final NoticiasStore store = Modular.get();
  final SharedStore sharedStore = Modular.get();

  Widget _buildDrawerItem(String descricao, IconData icone, GestureTapCallback onTap){
    return Column(
      children: [
        ListTile(
            title: Text(descricao,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black54,
                    letterSpacing: .5,
                    fontSize: 15,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
            leading: Icon(icone, size: 22,),
            onTap: onTap
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Divider(
            color: Colors.black12,
            height: 0.1,
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItemExit(String descricao, IconData icone, GestureTapCallback onTap){
    return Column(
      children: [
        ListTile(
            title: Text(descricao,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black54,
                    letterSpacing: .5,
                    fontSize: 15,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
            leading: Icon(icone, size: 22,),
            onTap: onTap
        ),

      ],
    );
  }

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
                Modular.to.pushNamed('/login/cliente');
              },
              child: Text("Fazer login", style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
            accountEmail: sharedStore.usuario != null ? Text(sharedStore.usuario!.email!, style: TextStyle(fontSize: 16, color: Colors.white),) : Container(height: 1,),
          ),

          _buildDrawerItem(
            'Encontre um profissional',
            Icons.search,
                (){Modular.to.pop(context);},
          ),
          _buildDrawerItem(
            'Quero oferecer um serviço',
            Icons.work_outline,
                (){
              sharedStore.logout();
              Modular.to.pushNamed('/login/profissional');
            },
          ),
          _buildDrawerItem(
            'Editar Meus Dados',
            Icons.settings,
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
          sharedStore.usuario != null ? _buildDrawerItem(
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
          _buildDrawerItem(
            'Fazer login',
            Icons.login,
                (){Modular.to.pushNamed('/login/cliente');},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}