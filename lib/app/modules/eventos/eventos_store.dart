import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:mobx/mobx.dart';

part 'eventos_store.g.dart';

class EventosStore = _EventosStoreBase with _$EventosStore;
abstract class _EventosStoreBase with Store {

  final Map<DateTime, List<CleanCalendarEvent>> eventos = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day):
    [
      CleanCalendarEvent(
          'Concurso UFRPE',
          startTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              10,
              0
          ),
          endTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              12,
              0
          ),
          description: 'Edital disponibilizado',
          color: Colors.blue
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
    [
      CleanCalendarEvent('Concurso Câmara de Araruna PR',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Concurso Prefeitura de Fênix PR',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
    [
      CleanCalendarEvent('Concurso SES MS',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Concurso CRMV MS',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
      CleanCalendarEvent('Concurso TJDFT',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.amber),
      CleanCalendarEvent(
          'Concurso SEFAZ ES',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.deepOrange),
      CleanCalendarEvent('Concurso UFG',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.green),
      CleanCalendarEvent('Aula revisão preparatório concurso SEFAZ ES',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.indigo),
    ],
  };
}