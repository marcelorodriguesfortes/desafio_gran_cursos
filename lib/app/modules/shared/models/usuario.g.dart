// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Usuario on _UsuarioBase, Store {
  final _$nomeAtom = Atom(name: '_UsuarioBase.nome');

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_UsuarioBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_UsuarioBase.senha');

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_UsuarioBase.cidade');

  @override
  String? get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String? value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$urlFotoAtom = Atom(name: '_UsuarioBase.urlFoto');

  @override
  String? get urlFoto {
    _$urlFotoAtom.reportRead();
    return super.urlFoto;
  }

  @override
  set urlFoto(String? value) {
    _$urlFotoAtom.reportWrite(value, super.urlFoto, () {
      super.urlFoto = value;
    });
  }

  final _$_UsuarioBaseActionController = ActionController(name: '_UsuarioBase');

  @override
  dynamic changeNome(String nome) {
    final _$actionInfo = _$_UsuarioBaseActionController.startAction(
        name: '_UsuarioBase.changeNome');
    try {
      return super.changeNome(nome);
    } finally {
      _$_UsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String email) {
    final _$actionInfo = _$_UsuarioBaseActionController.startAction(
        name: '_UsuarioBase.changeEmail');
    try {
      return super.changeEmail(email);
    } finally {
      _$_UsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String senha) {
    final _$actionInfo = _$_UsuarioBaseActionController.startAction(
        name: '_UsuarioBase.changeSenha');
    try {
      return super.changeSenha(senha);
    } finally {
      _$_UsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCidade(String cidade) {
    final _$actionInfo = _$_UsuarioBaseActionController.startAction(
        name: '_UsuarioBase.changeCidade');
    try {
      return super.changeCidade(cidade);
    } finally {
      _$_UsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUrlFoto(dynamic urlFoto) {
    final _$actionInfo = _$_UsuarioBaseActionController.startAction(
        name: '_UsuarioBase.changeUrlFoto');
    try {
      return super.changeUrlFoto(urlFoto);
    } finally {
      _$_UsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
senha: ${senha},
cidade: ${cidade},
urlFoto: ${urlFoto}
    ''';
  }
}
