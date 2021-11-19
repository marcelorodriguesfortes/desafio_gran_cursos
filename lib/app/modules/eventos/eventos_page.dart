import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_gran_cursos/app/modules/eventos/eventos_store.dart';
import 'package:flutter/material.dart';

class EventosPage extends StatefulWidget {
  final String title;
  const EventosPage({Key? key, this.title = 'EventosPage'}) : super(key: key);
  @override
  EventosPageState createState() => EventosPageState();
}
class EventosPageState extends State<EventosPage> {
  final EventosStore store = Modular.get();

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