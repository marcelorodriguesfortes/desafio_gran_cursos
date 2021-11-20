import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/usuario.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStoreBase with _$SharedStore;
abstract class _SharedStoreBase with Store {
  @observable
  Usuario? usuario;
  //var interstitialAd;

  void logout() {
    removeUsuario();
  }


  Future<bool> salvaUsuario(Usuario usuario) async {
    try{
      await save('usuario', usuario);
      return true;
    }catch(err){
      return false;
    }
  }

  Future<bool> removeUsuario() async {
    try{
      remove('usuario');
      usuario = null;
      return true;
    }catch(eer){
      return false;
    }
  }

  Future save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<Map<String, dynamic>?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('usuario')) {
      return json.decode(prefs.getString(key)!);
    }else {
      return null;
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}