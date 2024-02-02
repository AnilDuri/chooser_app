import 'package:chooser_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorState {
  ColorState({required this.id, required this.type});

  final String id;
  final ColorType type;
}

class ColorChoiceNotifier extends StateNotifier<ColorState> {
  ColorChoiceNotifier()
      : super(ColorState(id: 'initialColor', type: ColorType.solid));

  void toggleColorChoice(ColorState colorState) {
    state = colorState;
  }
}

final colorChoiceProvider =
    StateNotifierProvider<ColorChoiceNotifier, ColorState>((ref) {
  return ColorChoiceNotifier();
});
