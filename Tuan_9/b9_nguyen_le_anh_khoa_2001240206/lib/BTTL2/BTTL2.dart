import 'package:flutter/material.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/NotificationService.dart';
import 'VocabModel.dart';
import 'VocabFileService.dart';
import 'LearnWordScreen.dart';
import 'QuizWordScreen.dart';
import 'RemindersScreen.dart';

class BTTL2Screen extends StatefulWidget {
  const BTTL2Screen({super.key});

  @override
  State<BTTL2Screen> createState() => _BTTL2ScreenState();
}

class _BTTL2ScreenState extends State<BTTL2Screen> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();
  final VocabFileService _fileService = VocabFileService();
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.init();
  }

  Future<void> _saveAndSchedule() async {
    final word = _wordController.text.trim();
    final meaning = _meaningController.text.trim();

    if (word.isEmpty || meaning.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ từ và nghĩa!')),
      );
      return;
    }

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final vocabWord = VocabWord(
      id: id.toString(),
      word: word,
      meaning: meaning,
      createdAt: DateTime.now(),
    );

    final reminder = VocabReminder(
      id: id,
      word: word,
      meaning: meaning,
      remindAt: DateTime.now().add(const Duration(minutes: 10)),
    );

    await _fileService.addWord(vocabWord);
    await _fileService.addReminder(reminder);

    await _notificationService.scheduleNotificationAfter(
      const Duration(minutes: 10),
      'vocab_reminder_channel',
      'Ôn từ vựng mới!',
      'Đã tới lúc ôn tập từ: $word - $meaning',
      id: id,
      title: 'Ôn từ vựng mới!',
    );

    await _notificationService.showSimpleNotification(
      id + 1,
      'vocab_saved_channel',
      'Lưu từ vựng',
      'Lưu từ vựng thành công',
      'Đã lưu "$word" ($meaning). Nhắc nhở sẽ gửi sau 10 phút!',
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu và lên lịch nhắc học từ sau 10 phút'),
        duration: Duration(seconds: 3),
      ),
    );

    _wordController.clear();
    _meaningController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _wordController.dispose();
    _meaningController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Ứng dụng học từ vựng',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.person_pin,
                      size: 40,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Trợ lý học từ vựng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black87),
              title: const Text('Trang chính'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt, color: Colors.black87),
              title: const Text('Học từ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearnWordScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist, color: Colors.black87),
              title: const Text('Kiểm tra từ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizWordScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black87),
              title: const Text('Lịch nhắc'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RemindersScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _wordController,
              decoration: const InputDecoration(
                labelText: 'Từ',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _meaningController,
              decoration: const InputDecoration(
                labelText: 'Nghĩa',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _saveAndSchedule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF0F4F8),
                  foregroundColor: const Color(0xFF4A5568),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.grey.shade300, width: 0.8),
                  ),
                ),
                child: const Text(
                  'Lưu & Nhắc học sau 10 phút',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
