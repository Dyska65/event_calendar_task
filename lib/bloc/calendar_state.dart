part of 'calendar_bloc.dart';

abstract class CalendarState {
  List<EventEntity> events;
  CalendarState({required this.events});
}

class CalendarInitial extends CalendarState {
  CalendarInitial({super.events = const []});
}

class CalendarLoading extends CalendarState {
  CalendarLoading({required super.events});
}

class CalendarError extends CalendarState {
  final String errorMessage;
  CalendarError({required super.events, required this.errorMessage});
}

class CalendarSuccess extends CalendarState {
  CalendarSuccess({required super.events});
}
