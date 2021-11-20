import 'package:desafio_gran_cursos/app/modules/noticias/noticias_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/shared/shared_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NoticiasModule()),
  ];

}