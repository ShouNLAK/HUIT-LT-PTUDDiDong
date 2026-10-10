import 'dart:math';
import 'package:flutter/material.dart';
import 'VocabModel.dart';
import 'VocabFileService.dart';

class QuizQuestion {
  final VocabWord word;
  final String displayedMeaning;
  final bool isActuallyCorrect;

  QuizQuestion({
    required this.word,
    required this.displayedMeaning,
    required this.isActuallyCorrect,
  });
}

class QuizWordScreen extends StatefulWidget {
  const QuizWordScreen({super.key});

  @override
  State<QuizWordScreen> createState() => _QuizWordScreenState();
}

class _QuizWordScreenState extends State<QuizWordScreen> {
  final VocabFileService _fileService = VocabFileService();
  List<VocabWord> _allWords = [];
  final List<QuizQuestion> _questions = [];
  int _currentIndex = 0;
  int _correctCount = 0;
  int _wrongCount = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWordsAndPrepareQuiz();
  }

  Future<void> _loadWordsAndPrepareQuiz() async {
    final words = await _fileService.loadWords();
    _allWords = words;
    if (_allWords.isNotEmpty) {
      _generateQuestions();
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _generateQuestions() {
    _questions.clear();
    _currentIndex = 0;
    _correctCount = 0;
    _wrongCount = 0;

    final random = Random();
    final totalQuestions = min(10, max(_allWords.length, 5));

    for (int i = 0; i < totalQuestions; i++) {
      final word = _allWords[random.nextInt(_allWords.length)];
      final isCorrect = random.nextBool();
      String displayedMeaning = word.meaning;

      if (!isCorrect && _allWords.length > 1) {
        VocabWord otherWord;
        do {
          otherWord = _allWords[random.nextInt(_allWords.length)];
        } while (otherWord.word == word.word);
        displayedMeaning = otherWord.meaning;
      }

      _questions.add(
        QuizQuestion(
          word: word,
          displayedMeaning: displayedMeaning,
          isActuallyCorrect: isCorrect,
        ),
      );
    }
  }

  void _answer(bool userChoice) {
    if (_currentIndex >= _questions.length) return;

    final question = _questions[_currentIndex];
    final isUserRight = (userChoice == question.isActuallyCorrect);

    setState(() {
      if (isUserRight) {
        _correctCount++;
      } else {
        _wrongCount++;
      }
      _currentIndex++;
    });

    if (_currentIndex >= _questions.length) {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    final total = _questions.length;
    final accuracy = total > 0 ? ((_correctCount / total) * 100).toStringAsFixed(1) : "0.0";

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Center(
            child: Text(
              'Kết thúc bài kiểm tra',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tổng số câu: $total', style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 6),
              Text('✓ Đúng: $_correctCount', style: const TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('✗ Sai: $_wrongCount', style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Tỷ lệ chính xác: $accuracy%', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _generateQuestions();
                });
              },
              child: const Text('Làm lại', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Thoát', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_allWords.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Trắc nghiệm Đúng / Sai')),
        body: const Center(
          child: Text('Vui lòng thêm từ vựng trước khi kiểm tra!'),
        ),
      );
    }

    final hasQuestion = _currentIndex < _questions.length;
    final currentQ = hasQuestion ? _questions[_currentIndex] : null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trắc nghiệm Đúng / Sai'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF38D336),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '✓ Đúng: $_correctCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9500),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '✗ Sai: $_wrongCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: currentQ != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentQ.word.word,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              currentQ.displayedMeaning,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: hasQuestion ? () => _answer(true) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38D336),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      '✓ Đúng',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: hasQuestion ? () => _answer(false) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF3B30),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      '✗ Sai',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

