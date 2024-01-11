import 'package:event_calendar_task/bloc/calendar_bloc.dart';
import 'package:event_calendar_task/data/entity/event.dart';
import 'package:event_calendar_task/ui/screens/components/button_outline.dart';
import 'package:event_calendar_task/ui/screens/components/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime currentDateTime;
  final int idNewEntity;

  const AddEventDialog({
    super.key,
    required this.currentDateTime,
    required this.idNewEntity,
  });

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  DateTime? newDateTime;

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
                child: TimePicker(
                  title: 'Time',
                  currentDateTime: widget.currentDateTime,
                  onChanged: (dateTime) => newDateTime = dateTime,
                ),
              ),
            ],
          ),
        ),
        actions: [
          AppButton.outline(
            title: "Add event",
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                int id = await context
                    .read<CalendarCubit>()
                    .getNewEventIndexByDateTime(widget.currentDateTime);
                if (mounted) {
                  context.read<CalendarCubit>().addEventWrapper(
                        dateTime: widget.currentDateTime,
                        event: EventEntity(
                            id: id, title: titleController.text, dateTime: newDateTime!),
                      );
                  Navigator.pop(context);
                }
              }
            },
          ),
        ]);
  }
}
