import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChoiceNotifier extends StateNotifier<String> {
  ColorChoiceNotifier() : super('initialColor');

  void toggleColorChoice(String id) {
    state = id;
  }
}

final colorChoiceProvider =
    StateNotifierProvider<ColorChoiceNotifier, String>((ref) {
  return ColorChoiceNotifier();
});
