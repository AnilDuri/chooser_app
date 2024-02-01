import 'package:flutter/material.dart';

class MonoToneColor {
  const MonoToneColor(this.title, this.decoration);

  final String title;
  final BoxDecoration decoration;
}

const List<MonoToneColor> monoToneColorsList = [
  MonoToneColor(
    'Amber',
    BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.all(
        Radius.elliptical(20, 40),
      ),
    ),
  ),
  MonoToneColor(
    'Cyan',
    BoxDecoration(
      color: Colors.cyan,
      borderRadius: BorderRadius.all(
        Radius.elliptical(20, 40),
      ),
    ),
  ),
  MonoToneColor(
    'Purple',
    BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.all(
        Radius.elliptical(20, 40),
      ),
    ),
  ),
  MonoToneColor(
    'Light Green',
    BoxDecoration(
      color: Colors.lightGreen,
      borderRadius: BorderRadius.all(
        Radius.elliptical(20, 40),
      ),
    ),
  ),
  MonoToneColor(
    'Teal',
    BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.all(
        Radius.elliptical(20, 40),
      ),
    ),
  ),
];
