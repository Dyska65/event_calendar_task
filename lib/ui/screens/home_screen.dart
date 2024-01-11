import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:event_calendar_task/ui/screens/components/add_event_dialog.dart';
import 'package:event_calendar_task/bloc/calendar_bloc.dart';
import 'package:event_calendar_task/ui/screens/components/button_outline.dart';
import 'package:event_calendar_task/ui/screens/components/list_events.dart';
import 'package:event_calendar_task/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  bool isShowCalendar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Event Calendar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AppButton.outline(
                      title: "Day",
                      onTap: () => changeCalendarFormat(CalendarPeriod.day),
                    ),
                    AppButton.outline(
                      title: "Week",
                      onTap: () => changeCalendarFormat(CalendarPeriod.week),
                    ),
                    AppButton.outline(
                      title: "Month",
                      onTap: () => changeCalendarFormat(CalendarPeriod.month),
                    )
                  ]),
                ),
                if (isShowCalendar)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      headerVisible: true,
                      firstDay: DateTime.utc(2024, 1, 1),
                      lastDay: DateTime.utc(2025, 1, 1),
                      currentDay: DateTime.now(),
                      focusedDay: focusedDay,
                      calendarFormat: calendarFormat,
                      selectedDayPredicate: (day) => isSameDay(day, focusedDay),
                      onDaySelected: (selected, focused) => onDaySelected(selected),
                    ),
                  ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  height: 10,
                ),
                BlocBuilder<CalendarCubit, CalendarState>(
                  builder: (context, state) {
                    if (state is CalendarLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CalendarError) {
                      return Center(child: Text(state.errorMessage));
                    }
                    if (state.events.isEmpty) {
                      return const Center(child: Text("You have no events today"));
                    }
                    return ListEvents(
                      events: state.events,
                      onTapDelete: (event) =>
                          BlocProvider.of<CalendarCubit>(context).removeEvent(event, focusedDay),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int idNewEntity =
              await BlocProvider.of<CalendarCubit>(context).getNewEventIndexByDateTime(focusedDay);
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (c) => AddEventDialog(
              currentDateTime: focusedDay,
              idNewEntity: idNewEntity,
            ),
          );
        },
        tooltip: 'Add event',
        child: const Icon(Icons.add),
      ),
    );
  }

  changeCalendarFormat(CalendarPeriod calendarPeriod) {
    if (calendarPeriod == CalendarPeriod.day) {
      isShowCalendar = false;
    }
    if (calendarPeriod == CalendarPeriod.week) {
      isShowCalendar = true;
      calendarFormat = CalendarFormat.week;
    }
    if (calendarPeriod == CalendarPeriod.month) {
      isShowCalendar = true;
      calendarFormat = CalendarFormat.month;
    }
    setState(() {});
  }

  onDaySelected(DateTime selectedDay) {
    setState(() => focusedDay = selectedDay);
    BlocProvider.of<CalendarCubit>(context).getEventsByDayWrapper(selectedDay);
  }
}
