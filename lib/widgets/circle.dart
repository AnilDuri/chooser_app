import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Circle extends StatefulWidget {
  const Circle({
    super.key,
  });

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..forward();
    HapticFeedback.heavyImpact();
    super.initState();
  }

  @override
  void dispose() {
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
