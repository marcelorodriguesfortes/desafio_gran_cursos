import 'package:mobx/mobx.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStoreBase with _$SharedStore;
abstract class _SharedStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}