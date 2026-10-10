import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'VocabModel.dart';

class VocabFileService {
  Future<String> get _path async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _wordsFile async {
    final path = await _path;
    return File('$path/vocab_words.txt');
  }

  Future<File> get _remindersFile async {
    final path = await _path;
    return File('$path/vocab_reminders.txt');
  }
  Future<void> saveWords(List<VocabWord> words) async {
    final file = await _wordsFile;
    String data = words.map((e) => e.toFileString()).join("\n");
    await file.writeAsString(data);
  }

  Future<List<VocabWord>> loadWords() async {
    try {
      final file = await _wordsFile;
      if (!await file.exists()) {
        final defaults = [
          VocabWord(id: '1', word: 'subject', meaning: 'môn học, chủ đề', createdAt: DateTime.now()),
          VocabWord(id: '2', word: 'student', meaning: 'sinh viên, học sinh', createdAt: DateTime.now()),
          VocabWord(id: '3', word: 'teacher', meaning: 'giáo viên', createdAt: DateTime.now()),
          VocabWord(id: '4', word: 'school', meaning: 'trường học', createdAt: DateTime.now()),
          VocabWord(id: '5', word: 'library', meaning: 'thư viện', createdAt: DateTime.now()),
        ];
        await saveWords(defaults);
        return defaults;
      }
      final content = await file.readAsString();
      final words = content
          .split("\n")
          .where((e) => e.trim().isNotEmpty)
          .map((e) => VocabWord.fromString(e))
          .toList();
      return words;
    } catch (e) {
      return [];
    }
  }

  Future<void> addWord(VocabWord word) async {
    final words = await loadWords();
    words.add(word);
    await saveWords(words);
  }
  Future<void> saveReminders(List<VocabReminder> reminders) async {
    final file = await _remindersFile;
    String data = reminders.map((e) => e.toFileString()).join("\n");
    await file.writeAsString(data);
  }

  Future<List<VocabReminder>> loadReminders() async {
    try {
      final file = await _remindersFile;
      if (!await file.exists()) return [];
      final content = await file.readAsString();
      return content
          .split("\n")
          .where((e) => e.trim().isNotEmpty)
          .map((e) => VocabReminder.fromString(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addReminder(VocabReminder reminder) async {
    final reminders = await loadReminders();
    reminders.add(reminder);
    await saveReminders(reminders);
  }

  Future<void> deleteReminder(int id) async {
    final reminders = await loadReminders();
    reminders.removeWhere((r) => r.id == id);
    await saveReminders(reminders);
  }
}

