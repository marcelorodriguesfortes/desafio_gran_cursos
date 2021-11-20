import 'package:another_flushbar/flushbar.dart';
import 'package:desafio_gran_cursos/app/modules/login/login_store.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/models/usuario.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/custom_text.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/widget_botao.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/widget_campo.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final emailTextEditingController = TextEditingController();
  final senhalTextEditingController = TextEditingController();

  @override
  void initState() {
    store.usuario = new Usuario();
    super.initState();
  }

  void showFloatingFlushbar(BuildContext context, String mensagem) {
    Flushbar(
      title:  "Atenção!",
      message:  mensagem,
      titleColor: Colors.white,
      flushbarPosition: FlushbarPosition. BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.black45,
      isDismissible: false,
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.error_outline,
        color: active,
      ),

    )..show(context);
  }

  _buildBody(){
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset("assets/logo.png", height: 50),
                ),
                Expanded(child: Container()),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Login",
                    style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            WidgetCampo(
              labelText: 'E-mail',
              textInputType: TextInputType.text,
              textEditingController: emailTextEditingController,
              onChanged: (value){
                setState(() {
                  store.usuario!.changeEmail(value);
                });
              },
            ),

            SizedBox(height: 5),

            WidgetCampo(
              labelText: 'Senha',
              textInputType: TextInputType.text,
              textEditingController: senhalTextEditingController,
              onChanged: (value){
                setState(() {
                  store.usuario!.changeSenha(value);
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    CustomText(text: "Lembre-me",),
                  ],
                ),

                CustomText(
                    text: "Esqueceu a senha?",
                    color: active
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),

            WidgetButton(
              ativo: store.validaCampos() == null ? true : false,
              descricao: 'Continuar',
              onPressed: () async{
                if(await store.login(emailTextEditingController.text, senhalTextEditingController.text))
                  Modular.to.pushNamed('/');
                else
                  showFloatingFlushbar(context, 'Oops, algo deu errado. Revise seu usuário e senha!');
              },
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Ainda não possui usuário e senha? ", style: TextStyle(color: active))
                        ]
                    )),
              ],
            )

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            body: store.isLoading
                ? Center(child: CircularProgressIndicator(color: active))
                : _buildBody()
        );
      },
    );
  }
}