import 'package:flutter/material.dart';

import 'bai3/sms_reader_app.dart';
import 'bai3/contacts_reader_app.dart';
import 'bai2/media_picker_home.dart';
import 'bai1/photo_capture_app.dart';
import 'bai4/video_recorder_app.dart';
import 'bai5/contact_manager_app.dart';
import 'bai6/simple_audio_player.dart';
import 'bai7/sms_analyzer_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main App')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Main App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediaPickerHome()),
                  );
                },
                child: const Text('Bài 1: Chọn Media (MediaPicker)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoCaptureHome()),
                  );
                },
                child: const Text('Bài 2: Chụp ảnh (PhotoCapture)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SmsReaderApp()),
                  );
                },
                child: const Text('Bài 3: Đọc SMS (SmsReaderApp)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactsReaderApp()),
                  );
                },
                child: const Text('Bài 3: Đọc Danh bạ (ContactsReader)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoRecorderApp()),
                  );
                },
                child: const Text('Bài 4: Quay Video (VideoRecorder)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactManagerApp()),
                  );
                },
                child: const Text('Bài 5: Quản lý Danh bạ (ContactManager)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SimpleAudioPlayer()),
                  );
                },
                child: const Text('Bài 6: Phát Audio (AudioPlayer)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SmsAnalyzerApp()),
                  );
                },
                child: const Text('Bài 7: Phân tích SMS (SmsAnalyzer)', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}