import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoRecorderApp extends StatefulWidget {
  const VideoRecorderApp({super.key});

  @override
  State<VideoRecorderApp> createState() => _VideoRecorderAppState();
}

class _VideoRecorderAppState extends State<VideoRecorderApp> {
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;
  File? _videoFile;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _requestPermission(Permission permission) async {
    if (await permission.isDenied) {
      await permission.request();
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    if (source == ImageSource.camera) {
      PermissionStatus cameraStatus = await Permission.camera.request();
      if (cameraStatus.isPermanentlyDenied) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng cấp quyền Camera trong Cài đặt.')),
        );
        return;
      }
      await _requestPermission(Permission.microphone);
    } else {
      PermissionStatus videoStatus = await Permission.videos.request();
      if (videoStatus.isDenied) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng cấp quyền Thư viện để chọn video.')),
        );
        return;
      }
    }

    final XFile? pickedFile = await _picker.pickVideo(source: source);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _initializeVideoPlayer(_videoFile!);
      });
    }
  }

  void _initializeVideoPlayer(File file) {
    _videoController?.dispose();
    _videoController = VideoPlayerController.file(file);
    _videoController!.initialize().then((_) {
      setState(() {});
      _videoController!.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Recorder & Playback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_videoController != null && _videoController!.value.isInitialized)
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _videoController!.value.aspectRatio,
                      child: VideoPlayer(_videoController!),
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: Icon(
                        _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: () {
                        setState(() {
                          _videoController!.value.isPlaying
                              ? _videoController!.pause()
                              : _videoController!.play();
                        });
                      },
                    ),
                  ],
                )
              else
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Center(child: Text('Chưa có video nào được chọn')),
                ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _pickVideo(ImageSource.gallery),
                child: const Text('Chọn video từ Gallery'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _pickVideo(ImageSource.camera),
                child: const Text('Quay video từ Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
