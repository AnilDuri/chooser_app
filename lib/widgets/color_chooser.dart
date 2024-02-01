import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorChooser extends StatefulWidget {
  const ColorChooser({super.key});

  @override
  State<ColorChooser> createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text(
        'Mono Tones',
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.transparent,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: 70,
          height: 100,
          decoration: const BoxDecoration(color: Colors.amberAccent),
        )
      ],
    );
  }
}
