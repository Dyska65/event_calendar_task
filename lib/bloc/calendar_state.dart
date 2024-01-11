part of 'calendar_bloc.dart';

abstract class CalendarState {
  List<EventEntity> events;
  CalendarState({required this.events});
}

class CalendarInitial extends CalendarState {
  CalendarInitial({super.events = const []});
}

class CalendarLoading extends CalendarState {
  CalendarLoading({super.events = const []});
}

class CalendarError extends CalendarState {
  final String errorMessage;
  CalendarError({super.events = const [], required this.errorMessage});
}

class CalendarSuccess extends CalendarState {
  CalendarSuccess({super.events = const []});
}
