import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MonoToneColor {
  MonoToneColor(this.title, this.color, this.selected) : id = uuid.v4();

  final String id;
  final String title;
  final MaterialColor color;
  final bool selected;
  final String type = 'Monotone';
}

class GradientColors {
  GradientColors(this.title, this.color, this.selected) : id = uuid.v4();

  final String id;
  final String title;
  final List<MaterialColor> color;
  final bool selected;
  final String type = 'Gradient';
}

List colorsList = [
  MonoToneColor('Teal', Colors.teal, true),
  MonoToneColor('Amber', Colors.amber, false),
  MonoToneColor('BlueGray', Colors.blueGrey, false),
  MonoToneColor('Purple', Colors.purple, false),
  MonoToneColor('Light Green', Colors.lightGreen, false),
  GradientColors('Teal', [Colors.teal, Colors.lightBlue], false),
  GradientColors('Amber', [Colors.amber, Colors.orange], false),
  GradientColors('BlueGray', [Colors.blueGrey, Colors.grey], false),
  GradientColors('Purple', [Colors.purple, Colors.indigo], false),
  GradientColors('Light Green', [Colors.green, Colors.lightGreen], false),
];
