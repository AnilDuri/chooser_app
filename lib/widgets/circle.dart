import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class Circle extends StatefulWidget {
  const Circle({
    super.key,
  });

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final AudioPlayer _player;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..forward();
    HapticFeedback.heavyImpact();
    _player = AudioPlayer();
    _playPopIn();
    super.initState();
  }

  void _playPopIn() async {
    await _player.setAsset('assets/audio/pop-5.flac');
    _player.play();
  }

  void _playPopOut() async {
    await _player.setAsset('assets/audio/whoosh.flac');
    _player.play();
    _player.dispose();
  }

  @override
  void dispose() {
    _playPopOut();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
      child: const Icon(
        Icons.circle_outlined,
        size: 150,
        color: Colors.white,
      ),
    );
  }
}
