import 'package:desafio_gran_cursos/app/modules/login/login_module.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/noticias_store.dart';
import 'package:desafio_gran_cursos/app/modules/noticias/pages/noticias_page.dart';
import 'package:desafio_gran_cursos/app/modules/perfil/perfil_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NoticiasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NoticiasStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NoticiasPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/perfil', module: PerfilModule()),
  ];
}
