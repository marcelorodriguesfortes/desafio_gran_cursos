import 'package:desafio_gran_cursos/app/modules/noticias/noticias_module.dart';
import 'package:desafio_gran_cursos/app/modules/shared/repositories/repositorio_usuario.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/shared/shared_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedStore()),
    Bind.lazySingleton((i) => RepositorioUsuario()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NoticiasModule()),
  ];

}