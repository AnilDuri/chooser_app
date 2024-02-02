import 'package:chooser_app/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChoiceNotifier extends StateNotifier<List> {
  ColorChoiceNotifier() : super(colorsList);

  void toggleColorChoice(MaterialColor color) {
    state = state
        .map((item) =>
            MonoToneColor(item.title, item.color, item.color == color))
        .toList();
  }
}

final colorChoiceProvider =
    StateNotifierProvider<ColorChoiceNotifier, List>((ref) {
  return ColorChoiceNotifier();
});
