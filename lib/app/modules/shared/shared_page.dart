import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_gran_cursos/app/modules/shared/shared_store.dart';
import 'package:flutter/material.dart';

class SharedPage extends StatefulWidget {
  final String title;
  const SharedPage({Key? key, this.title = 'SharedPage'}) : super(key: key);
  @override
  SharedPageState createState() => SharedPageState();
}
class SharedPageState extends State<SharedPage> {
  final SharedStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}