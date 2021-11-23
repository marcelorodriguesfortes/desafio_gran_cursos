import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/widget_alert_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_gran_cursos/app/modules/perfil/perfil_store.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = 'PerfilPage'}) : super(key: key);
  @override
  PerfilPageState createState() => PerfilPageState();
}
class PerfilPageState extends State<PerfilPage> {
  final PerfilStore store = Modular.get();
  final SharedStore sharedStore = Modular.get();

  _widgetExcluirConta(String descricao, GestureTapCallback onTap, String subTitle){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: ListTile(
              leading: Icon(Icons.delete_outlined, color: Colors.red,),
              title: Text(descricao,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.red,
                    letterSpacing: .5,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              subtitle: Container(
                padding: new EdgeInsets.only(right: 13.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text(subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black54,
                          letterSpacing: .5,
                          fontSize: 15,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                ),
              ),
              onTap: onTap
          ),
        ),

      ],
    );
  }

  _widgetItemLista(String descricao, GestureTapCallback onTap, String subTitle){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: ListTile(
              title: Text(descricao,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black87,
                      letterSpacing: .5,
                      fontSize: 18,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
              subtitle: Container(
                padding: new EdgeInsets.only(right: 13.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text(subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black54,
                          letterSpacing: .5,
                          fontSize: 15,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                ),
              ),
              onTap: onTap
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Divider(
            height: 0.2,
          ),
        ),
      ],
    ) ;
  }

  _widgetBody(double height){
    return Container(
      height: height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 10),

            CircleAvatar(
              backgroundColor: active,
              radius: 80,
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
            ),

            Container(
              height: height * 0.8,
              child: ListView(
                children: [
                  _widgetItemLista(
                      'Nome',
                       (){} ,
                      sharedStore.usuario!.nome.toString()
                  ),

                  _widgetItemLista(
                      'E-mail',
                          (){} ,
                      sharedStore.usuario!.email.toString()
                  ),

                  _widgetItemLista(
                      'Cidade',
                          (){} ,
                      sharedStore.usuario!.cidade.toString()
                  ),

                  /*_buildListItem('Alterar senha', () {Modular.to.pushNamed('/alterasenha');} ,'* * * *'),*/
                  Container(height: 30,),
                  _widgetExcluirConta(
                      'Excluir conta',
                          () {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      WidgetAlertDialog(
                                          onPressed: () async{
                                             sharedStore.logout();
                                              Fluttertoast.showToast(
                                                  msg: "Exclusão realizada com sucesso!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.black38,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0
                                              );
                                              Modular.to.pushReplacementNamed('/');
                                          },
                                          titulo: 'Atenção!',
                                          pergunta: 'Você tem certeza que quer excluir sua conta?'
                                      )
                              );
                      } ,
                      'Deletar minha conta'),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Container(
          color: Colors.white,
          child: _widgetBody(height),
          padding: const EdgeInsets.all(16),
        )
    );
  }
}