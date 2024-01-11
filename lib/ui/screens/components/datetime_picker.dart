import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  final String title;
  final Function(DateTime) onChanged;
  final DateTime? initialValue;
  const DateTimePicker({
    super.key,
    required this.title,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: initialValue,
      validator: (value) => value == null ? "This field cantbe empty" : null,
      decoration: InputDecoration(
        isDense: true,
        hoverColor: Colors.transparent,
        hintText: title,
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
      initialDate: initialValue ?? DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (date != null && context.mounted) {
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
      onChanged(newDate);
      return newDate;
    }
    onChanged(DateTime.now());
    return DateTime.now();
  }
}
