import 'package:desafio_gran_cursos/app/modules/eventos/eventos_store.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventosPage extends StatefulWidget {
  final String title;
  const EventosPage({Key? key, this.title = 'EventosPage'}) : super(key: key);
  @override
  EventosPageState createState() => EventosPageState();
}
class EventosPageState extends State<EventosPage> {
  var storage = Modular.get<EventosStore>();

  @override
  void initState() {
    super.initState();
    _handleNewDate(
        DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Calendar(
          weekDays: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],
          events: storage.eventos,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          todayColor: Colors.blue,
          eventColor: Colors.grey,
          locale: 'pt_PT',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 11
          ),
        ),
      ),
    );
  }

  void _handleNewDate(date) {
    print('Data selecionada: $date');
  }
}