import 'package:flutter/material.dart';

class GradientColors {
  GradientColors({
    required this.id,
    required this.title,
    required this.color,
  });

  final String id;
  final String title;
  final List<MaterialColor> color;
}

List<GradientColors> monoToneColorsList = [
  GradientColors(
    id: '1',
    title: 'Amber',
    color: [Colors.amber, Colors.amber],
  ),
  GradientColors(
    id: '2',
    title: 'BlueGray',
    color: [Colors.blueGrey, Colors.blueGrey],
  ),
  GradientColors(
    id: '3',
    title: 'Purple',
    color: [Colors.purple, Colors.purple],
  ),
  GradientColors(
    id: '4',
    title: 'Light Green',
    color: [Colors.lightGreen, Colors.lightGreen],
  ),
  GradientColors(
    id: '5',
    title: 'Teal',
    color: [Colors.teal, Colors.teal],
  ),
];

List<GradientColors> gradientColorsList = [
  GradientColors(
      id: '1G', title: 'Teal', color: [Colors.teal, Colors.lightBlue]),
  GradientColors(
      id: '2G', title: 'Amber', color: [Colors.amber, Colors.orange]),
  GradientColors(
      id: '3G', title: 'BlueGray', color: [Colors.blueGrey, Colors.grey]),
  GradientColors(
      id: '4G', title: 'Purple', color: [Colors.purple, Colors.indigo]),
  GradientColors(
      id: '5G', title: 'Light Green', color: [Colors.green, Colors.lightGreen]),
];

List<GradientColors> combinedColors = [
  ...monoToneColorsList,
  ...gradientColorsList
];
