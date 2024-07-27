import 'package:zaracast/src/core/utils/extensions/date_time_extensions.dart';
import 'package:intl/intl.dart';

String formatBytes(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  } else if (bytes < 1048576) {
    return '${(bytes / 1024).toStringAsFixed(2)} KB';
  } else if (bytes < 1073741824) {
    return '${(bytes / 1048576).toStringAsFixed(2)} MB';
  } else {
    return '${(bytes / 1073741824).toStringAsFixed(2)} GB';
  }
}

// TODO(red): Instead of "Today" change it to "hours ago"
String formatDatePublished(int epoch) {
  final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  final daysAgo = date.daysFromToday;
  switch (daysAgo) {
    case 0:
      return 'Today';
    case 1:
      return 'Yesterday';
    case 2:
      return '2 days ago';
    case 3:
      return '3 days ago';
    case 4:
      return '4 days ago';
    case 5:
      return '5 days ago';
    case 6:
      return '6 days ago';
    case 7:
      return '7 days ago';
    default:
      return DateFormat.yMMMd().format(date);
  }
}

/*
String formatDuration(int seconds) {
  final minutes = seconds ~/ 60;
  if (minutes < 60) {
    return '${minutes}m';
  } else {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '${hours}h';
    } else {
      return '${hours}h ${remainingMinutes}m';
    }
  }
}


String trimString(String string, int maxLength) {
  if (string.length <= maxLength) {
    return string;
  } else {
    return '${string.substring(0, maxLength)}...';
  }
}*/
