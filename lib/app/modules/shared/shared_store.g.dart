// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SharedStore on _SharedStoreBase, Store {
  final _$valueAtom = Atom(name: '_SharedStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SharedStoreBaseActionController =
      ActionController(name: '_SharedStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_SharedStoreBaseActionController.startAction(
        name: '_SharedStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SharedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
