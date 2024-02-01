import 'package:flutter/material.dart';

class MonoToneColor {
  const MonoToneColor(this.title, this.color, this.selected);

  final String title;
  final MaterialColor color;
  final bool selected;
}

const List<MonoToneColor> monoToneColorsList = [
  MonoToneColor('Teal', Colors.teal, true),
  MonoToneColor('Amber', Colors.amber, false),
  MonoToneColor('BlueGray', Colors.blueGrey, false),
  MonoToneColor('Purple', Colors.purple, false),
  MonoToneColor('Light Green', Colors.lightGreen, false),
];
