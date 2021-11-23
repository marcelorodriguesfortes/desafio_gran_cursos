import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RepositorioUsuario {

  Future salvaUsuario(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<Map<String, dynamic>?> recuperaUsuario(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('usuario')) {
      return json.decode(prefs.getString(key)!);
    }else {
      return null;
    }
  }

  removeUsuario(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}