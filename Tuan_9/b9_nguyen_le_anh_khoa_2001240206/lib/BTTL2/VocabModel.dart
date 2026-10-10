class VocabWord {
  final String id;
  final String word;
  final String meaning;
  final DateTime createdAt;

  VocabWord({
    required this.id,
    required this.word,
    required this.meaning,
    required this.createdAt,
  });

  String toFileString() {
    return "$id|$word|$meaning|${createdAt.toIso8601String()}";
  }

  static VocabWord fromString(String line) {
    final parts = line.split("|");
    return VocabWord(
      id: parts[0],
      word: parts[1],
      meaning: parts[2],
      createdAt: parts.length > 3 ? DateTime.parse(parts[3]) : DateTime.now(),
    );
  }
}

class VocabReminder {
  final int id;
  final String word;
  final String meaning;
  final DateTime remindAt;

  VocabReminder({
    required this.id,
    required this.word,
    required this.meaning,
    required this.remindAt,
  });

  String toFileString() {
    return "$id|$word|$meaning|${remindAt.toIso8601String()}";
  }

  static VocabReminder fromString(String line) {
    final parts = line.split("|");
    return VocabReminder(
      id: int.parse(parts[0]),
      word: parts[1],
      meaning: parts[2],
      remindAt: DateTime.parse(parts[3]),
    );
  }
}
