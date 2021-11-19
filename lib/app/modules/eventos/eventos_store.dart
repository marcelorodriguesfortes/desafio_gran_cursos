import 'package:mobx/mobx.dart';

part 'eventos_store.g.dart';

class EventosStore = _EventosStoreBase with _$EventosStore;
abstract class _EventosStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}