import 'package:desafio_gran_cursos/app/modules/shared/shared_Page.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SharedPage()),
  ];
}
