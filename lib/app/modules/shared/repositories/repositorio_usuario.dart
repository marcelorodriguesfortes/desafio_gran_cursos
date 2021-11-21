import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RepositorioUsuario {

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