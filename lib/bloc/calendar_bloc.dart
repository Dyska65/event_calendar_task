import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:event_calendar_task/data/entity/event.dart';
import 'package:event_calendar_task/data/managers/shared_pref_manager.dart';
import 'package:event_calendar_task/utils.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial()) {
    getEventsByDayWrapper(DateTime.now());
  }

  Future<void> getEventsByDayWrapper(DateTime dateTime) async {
    emit(CalendarLoading());
    try {
      List<EventEntity> events = await _getEventsByDay(dateTime);
      emit(CalendarSuccess(events: events));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString()));
    }
  }

  Future<void> addEventWrapper({required DateTime dateTime, required EventEntity event}) async {
    emit(CalendarLoading());
    try {
      List<EventEntity> events = await _getEventsByDay(dateTime);
      events.add(event);

      _saveEventsByDay(dateTime, events);

      emit(CalendarSuccess(events: events));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString()));
    }
  }

  Future<void> removeEvent(EventEntity event, DateTime currentDateTime) async {
    emit(CalendarLoading());
    try {
      List<EventEntity> events = await _getEventsByDay(currentDateTime);
      events.removeWhere((element) => element.id == event.id);

      _saveEventsByDay(currentDateTime, events);

      emit(CalendarSuccess(events: events));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString()));
    }
  }

  Future<int> getNewEventIndexByDateTime(DateTime dateTime) async {
    try {
      List<EventEntity> events = await _getEventsByDay(dateTime);
      events.sort((a, b) => a.id.compareTo(b.id));
      return events.last.id + 1;
    } catch (e) {
      return -1;
    }
  }

  Future<List<EventEntity>> _getEventsByDay(DateTime dateTime) async {
    String keyDateTime = dateTimeToKeySharedPrefManager(dateTime);
    List? dataFromSharedPref = await SharedPrefManager.get(key: keyDateTime);

    if (dataFromSharedPref == null) {
      return [];
    }

    List<EventEntity> events =
        dataFromSharedPref.map<EventEntity>((element) => EventEntity.fromJson(element)).toList();
    return events;
  }

  Future<void> _saveEventsByDay(DateTime dateTime, List<EventEntity> events) async {
    SharedPrefManager.save(
        key: dateTimeToKeySharedPrefManager(dateTime),
        value: events.map<String>((EventEntity e) => e.toJson()).toList());
  }
}
