extension DateTimeExtension on DateTime {
  int get daysFromToday {
    final today = DateTime.now();
    return today.difference(this).inDays;
  }
}
