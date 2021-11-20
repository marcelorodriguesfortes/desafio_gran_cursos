import 'package:another_flushbar/flushbar.dart';
import 'package:desafio_gran_cursos/app/modules/login/login_store.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/widgets/custom_text.dart';
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
  final tecEmail = TextEditingController();
  final tecSenha = TextEditingController();

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
      //boxShadows: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 2.0), blurRadius: 60.0)],
      //backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
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
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: tecEmail,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "abc@dominio.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: tecSenha,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "123",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
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
            InkWell(
              onTap: () async{
                if(tecEmail.text.isEmpty || tecSenha.text.isEmpty) {
                  showFloatingFlushbar(context, 'Preencha todos os campos.');
                  return;
                }

                if(await store.login(tecEmail.text, tecSenha.text))
                  Modular.to.pushNamed('/');
                else
                  showFloatingFlushbar(context, 'Oops, algo deu errado. Revise seu usuário e senha!');
              },
              child: Container(
                decoration: BoxDecoration(color: active,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomText(
                  text: "Login",
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

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