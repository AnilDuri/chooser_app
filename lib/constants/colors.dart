import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum ColorType { gradient, solid }

class MonoToneColor {
  MonoToneColor({required this.title, required this.color, String? id})
      : id = id ?? uuid.v4();

  final String id;
  final String title;
  final MaterialColor color;
  final ColorType type = ColorType.solid;
}

class GradientColors {
  GradientColors(this.title, this.color) : id = uuid.v4();

  final String id;
  final String title;
  final List<MaterialColor> color;
  final ColorType type = ColorType.gradient;
}

List<MonoToneColor> monoToneColorsList = [
  MonoToneColor(title: 'Teal', color: Colors.teal, id: 'initialColor'),
  MonoToneColor(
    title: 'Amber',
    color: Colors.amber,
  ),
  MonoToneColor(
    title: 'BlueGray',
    color: Colors.blueGrey,
  ),
  MonoToneColor(
    title: 'Purple',
    color: Colors.purple,
  ),
  MonoToneColor(
    title: 'Light Green',
    color: Colors.lightGreen,
  ),
];

List<GradientColors> gradientColors = [
  GradientColors('Teal', [Colors.teal, Colors.lightBlue]),
  GradientColors('Amber', [Colors.amber, Colors.orange]),
  GradientColors('BlueGray', [Colors.blueGrey, Colors.grey]),
  GradientColors('Purple', [Colors.purple, Colors.indigo]),
  GradientColors('Light Green', [Colors.green, Colors.lightGreen]),
];

List combinedColoredList = [...monoToneColorsList, gradientColors];
