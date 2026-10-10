import 'package:flutter/material.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/NotificationService.dart';
import 'VocabModel.dart';
import 'VocabFileService.dart';

class LearnWordScreen extends StatefulWidget {
  const LearnWordScreen({super.key});

  @override
  State<LearnWordScreen> createState() => _LearnWordScreenState();
}

class _LearnWordScreenState extends State<LearnWordScreen> {
  final VocabFileService _fileService = VocabFileService();
  final NotificationService _notificationService = NotificationService();
  final TextEditingController _meaningController = TextEditingController();

  List<VocabWord> _words = [];
  int _currentIndex = 0;
  int _correctCount = 0;
  int _wrongCount = 0;
  bool _isLoading = true;
  String? _statusMessage;
  bool _isCorrectAnswer = false;

  @override
  void initState() {
    super.initState();
    _notificationService.init();
    _loadWords();
  }

  Future<void> _loadWords() async {
    final words = await _fileService.loadWords();
    setState(() {
      _words = words;
      _isLoading = false;
    });
  }

  void _checkAnswer() {
    if (_words.isEmpty) return;
    final currentWord = _words[_currentIndex];
    final input = _meaningController.text.trim().toLowerCase();
    final actual = currentWord.meaning.trim().toLowerCase();
    bool isMatch = false;
    if (input.isNotEmpty) {
      if (actual.contains(input) || input.contains(actual)) {
        isMatch = true;
      } else {
        final actualParts = actual.split(RegExp(r'[,;/|\s]+'));
        final inputParts = input.split(RegExp(r'[,;/|\s]+'));
        isMatch = inputParts.any((p) => p.isNotEmpty && actualParts.contains(p));
      }
    }

    setState(() {
      if (isMatch) {
        _correctCount++;
        _statusMessage = "Chính xác!";
        _isCorrectAnswer = true;
      } else {
        _wrongCount++;
        _statusMessage = "Sai rồi!";
        _isCorrectAnswer = false;
        if (_wrongCount > 0 && _wrongCount % 3 == 0) {
          _notificationService.showSimpleNotification(
            999,
            "vocab_warning_channel",
            "Cảnh báo học tập",
            "Cảnh báo ôn tập",
            "Bạn đã trả lời sai $_wrongCount từ! Hãy ôn tập kỹ hơn nhé.",
          );
        }
      }
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        _meaningController.clear();
        _statusMessage = null;
        if (_currentIndex < _words.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
          _words.shuffle();
        }
      });
    });
  }

  @override
  void dispose() {
    _meaningController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_words.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ôn tập từ mới')),
        body: const Center(
          child: Text(
            'Chưa có từ vựng nào. Hãy thêm từ vựng ở Trang chính!',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    final currentWord = _words[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ôn tập từ mới'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF38D336),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '✓ $_correctCount từ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF9500),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '✗ $_wrongCount từ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC7DBEC),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Text(
                          currentWord.word,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _meaningController,
                          decoration: InputDecoration(
                            hintText: 'Nhập nghĩa tiếng Việt',
                            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onSubmitted: (_) => _checkAnswer(),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: _checkAnswer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004CE8),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Check',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_statusMessage != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: _isCorrectAnswer ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
              child: Text(
                _statusMessage!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

