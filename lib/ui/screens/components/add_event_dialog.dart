import 'package:event_calendar_task/bloc/calendar_bloc.dart';
import 'package:event_calendar_task/data/entity/event.dart';
import 'package:event_calendar_task/ui/screens/components/button_outline.dart';
import 'package:event_calendar_task/ui/screens/components/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final DateTime currentDateTime;
  final int idNewEntity;

  AddEventDialog({
    super.key,
    required this.currentDateTime,
    required this.idNewEntity,
  });

  String? title;
  DateTime? newDateTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        actionsAlignment: MainAxisAlignment.center,
        title: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Event "),
              Text(" ${currentDateTime.day} - ${currentDateTime.month} - ${currentDateTime.year}"),
            ],
          ),
        ),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Title"),
                validator: (value) =>
                    value == null || value.isEmpty ? "This field cantbe empty" : null,
                onChanged: (value) => title = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimePicker(
                title: 'Time',
                currentDateTime: currentDateTime,
                onChanged: (dateTime) => newDateTime = dateTime,
              ),
            ),
          ],
        ),
        actions: [
          BlocProvider.value(
            value: BlocProvider.of<CalendarCubit>(context),
            child: AppButton.outline(
              title: "Add event",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<CalendarCubit>(context).addEventWrapper(
                    dateTime: currentDateTime,
                    event: EventEntity(id: 1, title: title!, dateTime: newDateTime!),
                  );
                }
              },
            ),
          )
        ]);
  }
}
