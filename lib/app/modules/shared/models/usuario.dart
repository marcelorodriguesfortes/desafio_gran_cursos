import 'package:mobx/mobx.dart';
import 'dart:io';
part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {
  @observable
  int? codUsuario;
  @action
  changeCodUsuario(int codUsuario) => this.codUsuario = codUsuario;

  @observable
  String? nome;
  @action
  changeNome(String nome) => this.nome = nome;

  @observable
  String? telefone;
  @action
  changeTelefone(String telefone) => this.telefone = telefone;

  @observable
  String? email;
  @action
  changeEmail(String email) => this.email = email;

  @observable
  String? cep;
  @action
  changeCep(String cep) => this.cep = cep;

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
      'codUsuario' : codUsuario,
      'nome' : nome,
      'telefone' : telefone,
      'email' : email,
      'cep' : cep,
      'cidade' : cidade,
      'verificado' : false,
      'urlFoto' : urlFoto,
    };
    return map;
  }

  Map<String, dynamic> toJson() => {
    'codUsuario' : codUsuario,
    'nome' : nome,
    'telefone' : telefone,
    'email' : email,
    'cep' : cep,
    'cidade' : cidade,
    'verificado' : false,
    'urlFoto' : urlFoto,
  };
}

