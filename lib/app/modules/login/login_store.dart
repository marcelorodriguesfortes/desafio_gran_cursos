import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  @observable
  bool isLoading = false;

  @action
  Future<bool> login(String usuario, String senha) async{
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