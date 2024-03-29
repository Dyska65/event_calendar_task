import 'dart:convert';

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
    emit(CalendarLoading(events: state.events));
    try {
      List<EventEntity> events = await _getEventsByDay(dateTime);
      emit(CalendarSuccess(events: events));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString(), events: state.events));
    }
  }

  Future<void> addEventWrapper({required DateTime dateTime, required EventEntity event}) async {
    emit(CalendarLoading(events: state.events));
    try {
      int durationEvent = DateUtils.dateOnly(event.endDateTime)
          .difference(DateUtils.dateOnly(event.startDateTime))
          .inDays;

      for (var i = 0; i <= durationEvent; i++) {
        final DateTime date = DateUtils.addDaysToDate(event.startDateTime, i);
        _saveEventsByDay(date, [...await _getEventsByDay(date), event]);
      }

      emit(CalendarSuccess(events: [...state.events, event]));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString(), events: state.events));
    }
  }

  Future<void> removeEvent(EventEntity event) async {
    emit(CalendarLoading(events: state.events));
    try {
      int durationEvent = DateUtils.dateOnly(event.endDateTime)
          .difference(DateUtils.dateOnly(event.startDateTime))
          .inDays;
      for (var i = 0; i <= durationEvent; i++) {
        final DateTime date = DateUtils.addDaysToDate(event.startDateTime, i);
        await _saveEventsByDay(date, [
          ...await _getEventsByDay(date)
            ..removeWhere((element) => element.id == event.id)
        ]);
      }

      emit(
        CalendarSuccess(
            events: [...state.events..removeWhere((element) => element.id == event.id)]),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString(), events: state.events));
    }
  }

  Future<void> editEvent(EventEntity event) async {
    emit(CalendarLoading(events: state.events));
    try {
      EventEntity oldEvent = state.events.firstWhere((element) => element.id == event.id);
      await removeEvent(oldEvent);

      int durationEvent = DateUtils.dateOnly(event.endDateTime)
          .difference(DateUtils.dateOnly(event.startDateTime))
          .inDays;

      for (var i = 0; i <= durationEvent; i++) {
        final DateTime date = DateUtils.addDaysToDate(event.startDateTime, i);
        _saveEventsByDay(date, [...await _getEventsByDay(date), event]);
      }

      emit(CalendarSuccess(events: [...state.events, event]));
    } catch (e) {
      debugPrint(e.toString());
      emit(CalendarError(errorMessage: e.toString(), events: state.events));
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
    List<String>? dataFromSharedPref = await SharedPrefManager.get(key: keyDateTime);

    if (dataFromSharedPref == null) {
      return [];
    }

    List<EventEntity> events = dataFromSharedPref.map<EventEntity>((element) {
      print(element.toString() + "!!!!!!!!23");
      final Map<String, dynamic> json = jsonDecode(element);
      print(json.toString() + "!!!!!!!!23");

      return EventEntity.fromJson(json);
    }).toList();
    return events;
  }

  Future<void> _saveEventsByDay(DateTime dateTime, List<EventEntity> events) async {
    SharedPrefManager.save(
        key: dateTimeToKeySharedPrefManager(dateTime),
        value: events.map<String>((EventEntity e) => jsonEncode(e.toJson())).toList());
  }
}
