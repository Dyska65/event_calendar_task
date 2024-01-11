import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final String title;
  final Function(DateTime) onChanged;
  const DateTimePicker({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      validator: (value) => value == null ? "This field cantbe empty" : null,
      decoration: InputDecoration(
        isDense: true,
        hoverColor: Colors.transparent,
        hintText: widget.title,
      ),
      format: DateFormat("dd-MM-yyyy HH:mm"),
      onShowPicker: (context, currentValue) async =>
          await onShowPicker(context: context, currentValue: currentValue),
    );
  }

  onShowPicker({required BuildContext context, required DateTime? currentValue}) async {
    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      initialDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (date != null && mounted) {
      final TimeOfDay? time = await showTimePicker(
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
      DateTime? newDate = DateTimeField.combine(date, time);
      widget.onChanged(newDate);
      return newDate;
    }
    widget.onChanged(DateTime.now());
    return DateTime.now();
  }
}
