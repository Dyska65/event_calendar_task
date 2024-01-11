import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  final String title;
  final DateTime currentDateTime;
  final Function(DateTime) onChanged;
  const TimePicker({
    super.key,
    required this.title,
    required this.currentDateTime,
    required this.onChanged,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      validator: (value) => value == null ? "This field cantbe empty" : null,
      decoration: const InputDecoration(
        isDense: true,
        hoverColor: Colors.transparent,
        hintText: "Time",
      ),
      format: DateFormat("dd-MM-yyyy HH:mm"),
      onShowPicker: (context, currentValue) async =>
          await onShowPicker(context: context, currentValue: currentValue),
    );
  }

  onShowPicker({required BuildContext context, required DateTime? currentValue}) async {
    // ignore: use_build_context_synchronously
    final time = await showTimePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
    );
    DateTime? newDate = DateTimeField.combine(widget.currentDateTime, time);
    widget.onChanged(newDate);
    return newDate;
  }
}
