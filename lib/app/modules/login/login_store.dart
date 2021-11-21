import 'package:desafio_gran_cursos/app/modules/shared/models/usuario.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  SharedStore sharedStore = Modular.get();

  @observable
  bool isLoading = false;
  @observable
  Usuario usuario =  Usuario();


  String? validaCampos(){
    if(usuario.email == null || usuario.email!.isEmpty || !usuario.email!.contains('@') ||
        usuario.senha == null || usuario.senha!.isEmpty) {
      return 'Erro';
    }else
      return null;
  }


  @action
  Future<bool> login(String email, String senha) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    if(email.compareTo("teste@mail.com") == 0 && senha.compareTo("123") == 0) {

      this.usuario.changeNome('Cristina');
      this.usuario.changeCidade('Morrinhos');
      this.usuario.changeUrlFoto('https://firebasestorage.googleapis.com/v0/b/findapp-66b86.appspot.com/o/profile-photo.jpg?alt=media&token=48b1a725-28d3-49aa-b4ff-8fd176fce48b');
      sharedStore.usuario = this.usuario;

      if(await sharedStore.salvaUsuario(usuario))
        print('usuário salvo com sucesso');
      else
        print('erro ao salvar o usuário');


      isLoading = false;
      return true;
    }
    isLoading = false;
    return false;
  }
}