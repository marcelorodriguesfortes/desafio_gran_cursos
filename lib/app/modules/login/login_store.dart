import 'package:desafio_gran_cursos/app/modules/shared/models/usuario.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  @observable
  bool isLoading = false;
  @observable
  Usuario? usuario =  Usuario();


  String? validaCampos(){
    if(usuario!.email == null || usuario!.email!.isEmpty || !usuario!.email!.contains('@') ||
        usuario!.senha == null || usuario!.senha!.isEmpty) {
      return 'Erro';
    }else
      return null;
  }


  @action
  Future<bool> login(String usuario, String senha) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    if(usuario.compareTo("teste@mail.com") == 0 && senha.compareTo("123") == 0) {
      isLoading = false;
      return true;
    }
    isLoading = false;
    return false;
  }
}