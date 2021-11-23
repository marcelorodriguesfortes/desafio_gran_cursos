import 'package:mobx/mobx.dart';
part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {

  @observable
  String? nome;
  @action
  changeNome(String nome) => this.nome = nome;


  @observable
  String? email;
  @action
  changeEmail(String email) => this.email = email;

  @observable
  String? senha;
  @action
  changeSenha(String senha) => this.senha = senha;

  @observable
  String? cidade;
  @action
  changeCidade(String cidade) => this.cidade = cidade;


  @observable
  String? urlFoto;
  @action
  changeUrlFoto(urlFoto){
    this.urlFoto = urlFoto;
  }


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nome' : nome,
      'email' : email,
      'senha' : senha,
      'cidade' : cidade,
      'urlFoto' : urlFoto,
    };
    return map;
  }

  Map<String, dynamic> toJson() => {
    'nome' : nome,
    'email' : email,
    'senha' : senha,
    'cidade' : cidade,
    'verificado' : false,
    'urlFoto' : urlFoto,
  };
}

