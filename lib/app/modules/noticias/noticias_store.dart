import 'package:mobx/mobx.dart';

import 'models/noticia.dart';

part 'noticias_store.g.dart';

class NoticiasStore = _NoticiasStoreBase with _$NoticiasStore;
abstract class _NoticiasStoreBase with Store {

  @observable
  Noticia? noticia;

}