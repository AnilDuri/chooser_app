import 'package:chooser_app/widgets/circle.dart';
import 'package:chooser_app/widgets/touch_indicator.dart';
import 'package:flutter/material.dart';

class FingerTapChoiceScreen extends StatelessWidget {
  const FingerTapChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TouchIndicator(
      indicator: const Circle(),
      indicatorSize: 150,
      child: Scaffold(
          appBar: AppBar(title: const Text('Finger Chooser')),
          backgroundColor: Colors.amberAccent,
          body: Text('Text Chooser')),
    );
  }
}
