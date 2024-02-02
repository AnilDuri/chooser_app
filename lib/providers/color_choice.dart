import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class ColorChoiceNotifier extends StateNotifier<String> {
  ColorChoiceNotifier(this.pref) : super(pref?.getString('color_id') ?? '1');

  final SharedPreferences? pref;

  void toggleColorChoice(String id) {
    state = id;
    pref!.setString('color_id', id);
  }
}

final colorChoiceProvider =
    StateNotifierProvider<ColorChoiceNotifier, String>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return ColorChoiceNotifier(pref);
});
