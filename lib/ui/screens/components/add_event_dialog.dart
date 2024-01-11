import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:event_calendar_task/bloc/calendar_bloc.dart';
import 'package:event_calendar_task/data/entity/event.dart';
import 'package:event_calendar_task/ui/screens/components/button_outline.dart';
import 'package:event_calendar_task/ui/screens/components/datetime_picker.dart';

class EventDialog extends StatefulWidget {
  final DateTime currentDateTime;
  final int idNewEntity;
  final EventEntity? event;
  final String titleButton;

  const EventDialog({
    super.key,
    required this.currentDateTime,
    required this.idNewEntity,
    required this.titleButton,
    this.event,
  });

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  DateTime? startDateTime;
  DateTime? endDateTime;

  @override
  void initState() {
    titleController.text = widget.event?.title ?? "";
    startDateTime = widget.event?.startDateTime;
    endDateTime = widget.event?.endDateTime;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        actionsAlignment: MainAxisAlignment.center,
        title: Column(
          children: [
            const Text("Event "),
            Text(
                " ${widget.currentDateTime.day} - ${widget.currentDateTime.month} - ${widget.currentDateTime.year}"),
          ],
        ),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Title"),
                  validator: (value) =>
                      value == null || value.isEmpty ? "This field cantbe empty" : null,
                  controller: titleController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimePicker(
                  title: 'Start time',
                  initialValue: startDateTime,
                  onChanged: (dateTime) => startDateTime = dateTime,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimePicker(
                  title: 'End time',
                  initialValue: endDateTime,
                  onChanged: (dateTime) => endDateTime = dateTime,
                ),
              ),
            ],
          ),
        ),
        actions: [
          AppButton.outline(
            title: widget.titleButton,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                if (widget.titleButton == "Add event") {
                  await _addedEvent();
                  return;
                }
                if (widget.titleButton == "Modify" && widget.event != null) {
                  await _editEvent();
                  return;
                }
              }
            },
          ),
        ]);
  }

  _addedEvent() async {
    int id = await context.read<CalendarCubit>().getNewEventIndexByDateTime(widget.currentDateTime);
    if (mounted) {
      context.read<CalendarCubit>().addEventWrapper(
            dateTime: widget.currentDateTime,
            event: EventEntity(
              id: id,
              title: titleController.text,
              startDateTime: startDateTime!,
              endDateTime: endDateTime!,
            ),
          );

      Navigator.pop(context);
    }
  }

  _editEvent() async {
    context.read<CalendarCubit>().editEvent(
          widget.event!.copyWith(
            title: titleController.text,
            startDateTime: startDateTime!,
            endDateTime: endDateTime!,
          ),
        );
    Navigator.pop(context);
  }
}
