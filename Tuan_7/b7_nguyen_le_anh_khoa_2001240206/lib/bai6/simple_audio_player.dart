import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SimpleAudioPlayer extends StatefulWidget {
  const SimpleAudioPlayer({super.key});

  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = 0;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  late AnimationController _animationController;

  final List<Map<String, String>> songs = [
    {'title': 'The Winner takes it All ', 'artist': 'ABBA', 'file': 'The Winner Takes It All.mp3'},
    {'title': 'Bài Hát Số 2', 'artist': 'Ca Sĩ B', 'file': 'song2.mp3'},
    {'title': 'Bài Hát Số 3', 'artist': 'Ca Sĩ C', 'file': 'song3.mp3'},
    {'title': 'Bài Hát Số 4', 'artist': 'Ca Sĩ D', 'file': 'song4.mp3'},
    {'title': 'Bài Hát Số 5', 'artist': 'Ca Sĩ E', 'file': 'song5.mp3'},
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
          if (isPlaying) {
            _animationController.repeat();
          } else {
            _animationController.stop();
          }
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _next();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _play(int index) async {
    setState(() {
      currentIndex = index;
    });
    try {
      await _audioPlayer.play(AssetSource('audios/${songs[currentIndex]['file']}'));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không tìm thấy file: assets/audios/${songs[currentIndex]['file']}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
  }

  void _next() {
    if (currentIndex < songs.length - 1) {
      _play(currentIndex + 1);
    } else {
      _play(0);
    }
  }

  void _previous() {
    if (currentIndex > 0) {
      _play(currentIndex - 1);
    } else {
      _play(songs.length - 1);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'NOW PLAYING',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2C1B3D),
              Color(0xFF110C1A),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: isPlaying ? _animationController.value * 2 * pi : 0,
                    child: child,
                  );
                },
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD6336C).withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      )
                    ],
                    gradient: const RadialGradient(
                      colors: [Color(0xFF3A3A52), Color(0xFF1E1E2C)],
                    ),
                    border: Border.all(color: Colors.white10, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Color(0xFFD6336C),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                songs[currentIndex]['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                songs[currentIndex]['artist']!,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      _formatDuration(_position),
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0xFFD6336C),
                          inactiveTrackColor: Colors.white24,
                          thumbColor: const Color(0xFFD6336C),
                          trackHeight: 4.0,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                        ),
                        child: Slider(
                          min: 0,
                          max: _duration.inSeconds.toDouble() > 0 
                               ? _duration.inSeconds.toDouble() 
                               : 1.0,
                          value: _position.inSeconds.toDouble().clamp(0.0, _duration.inSeconds.toDouble() > 0 ? _duration.inSeconds.toDouble() : 1.0),
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await _audioPlayer.seek(position);
                          },
                        ),
                      ),
                    ),
                    Text(
                      _formatDuration(_duration),
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white54),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                      onPressed: _previous,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isPlaying) {
                          _pause();
                        } else {
                          _play(currentIndex);
                        }
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6336C),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD6336C).withValues(alpha: 0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                      onPressed: _next,
                    ),
                    IconButton(
                      icon: const Icon(Icons.repeat, color: Colors.white54),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(color: Colors.white10, height: 1),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == currentIndex;
                    return ListTile(
                      onTap: () => _play(index),
                      leading: Text(
                        '${index + 1}.',
                        style: TextStyle(
                          color: isSelected ? const Color(0xFFD6336C) : Colors.white54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        songs[index]['title']!,
                        style: TextStyle(
                          color: isSelected ? const Color(0xFFD6336C) : Colors.white,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        songs[index]['artist']!,
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      trailing: isSelected && isPlaying
                          ? const Icon(Icons.bar_chart, color: Color(0xFFD6336C))
                          : const Icon(Icons.more_vert, color: Colors.white54),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
