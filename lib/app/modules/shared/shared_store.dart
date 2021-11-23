import 'package:desafio_gran_cursos/app/modules/shared/repositories/repositorio_usuario.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'models/usuario.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStoreBase with _$SharedStore;
abstract class _SharedStoreBase with Store {

  RepositorioUsuario repositorioUsuario = Modular.get();

  @observable
  Usuario? usuario;

  void logout() {
    removeUsuario();
  }

  Future<bool> salvaUsuario(Usuario usuario) async {
    try{
      await repositorioUsuario.salvaUsuario('usuario', usuario);
      return true;
    }catch(err){
      return false;
    }
  }


  Future<bool> removeUsuario() async {
    try{
      repositorioUsuario.removeUsuario('usuario');
      usuario = null;
      return true;
    }catch(eer){
      return false;
    }
  }

  Future<bool> recuperaUsuarioLogado() async {
    Map<String, dynamic>? valor;

    try{
      valor = await  repositorioUsuario.recuperaUsuario('usuario');
    }catch(eer){
      valor = null;
    }

    if(valor != null){
      print('Usuário recuperado com sucesso! Nome:  ' + valor['nome']);
      usuario = new Usuario();
      usuario!.changeNome(valor['nome']);
      usuario!.changeEmail(valor['email']);
      usuario!.changeCidade(valor['cidade']);
      usuario!.changeUrlFoto(valor['urlFoto']);
      return true;
    }
    return false;
  }


}