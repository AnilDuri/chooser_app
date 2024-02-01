import 'package:chooser_app/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChoiceNotifier extends StateNotifier<List<MonoToneColor>> {
  ColorChoiceNotifier() : super(monoToneColorsList);

  void toggleColorChoice(MaterialColor color) {
    state = state
        .map((item) =>
            MonoToneColor(item.title, item.color, item.color == color))
        .toList();
  }
}

final colorChoiceProvider =
    StateNotifierProvider<ColorChoiceNotifier, List<MonoToneColor>>((ref) {
  return ColorChoiceNotifier();
});
