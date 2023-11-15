import 'package:flutter/material.dart';

class ShakerChoiceScreen extends StatefulWidget {
  const ShakerChoiceScreen({super.key});

  @override
  State<ShakerChoiceScreen> createState() {
    return _ShakerChoiceScreen();
  }
}

class _ShakerChoiceScreen extends State<ShakerChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
              'Add people to your list and start shaking to determing who remains')),
    );
  }
}
