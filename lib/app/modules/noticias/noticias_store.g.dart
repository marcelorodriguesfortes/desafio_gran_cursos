// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticias_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoticiasStore on _NoticiasStoreBase, Store {
  final _$noticiaAtom = Atom(name: '_NoticiasStoreBase.noticia');

  @override
  Noticia? get noticia {
    _$noticiaAtom.reportRead();
    return super.noticia;
  }

  @override
  set noticia(Noticia? value) {
    _$noticiaAtom.reportWrite(value, super.noticia, () {
      super.noticia = value;
    });
  }

  @override
  String toString() {
    return '''
noticia: ${noticia}
    ''';
  }
}
