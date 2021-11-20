import 'package:desafio_gran_cursos/app/modules/login/login_module.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/noticias_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NoticiasModule()),
  ];

}