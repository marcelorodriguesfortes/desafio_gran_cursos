import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Gran Cursos',
      theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.grey
      ),
    ).modular();
  }
}