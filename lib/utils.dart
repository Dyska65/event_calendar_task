enum CalendarPeriod {
  day,
  week,
  month,
}

String dateTimeToKeySharedPrefManager(DateTime dateTime) =>
    "${dateTime.day}${dateTime.month}${dateTime.year}";
