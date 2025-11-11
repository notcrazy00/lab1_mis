class Exam {
  final String subject;
  final DateTime dateTime;
  final List<String> rooms;

  Exam({
    required this.subject,
    required this.dateTime,
    required this.rooms,
  });

  bool get isPassed {
    return dateTime.isBefore(DateTime.now());
  }

  String get formattedDate {
    final months = [
      'јануари', 'февруари', 'март', 'април', 'мај', 'јуни',
      'јули', 'август', 'септември', 'октомври', 'ноември', 'декември'
    ];
    return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}';
  }

  String get formattedTime {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.isNegative) {
      return 'Испитот е завршен';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    if (days == 0) {
      return 'Денес во $formattedTime';
    }

    return '$days дена, $hours часа';
  }
}