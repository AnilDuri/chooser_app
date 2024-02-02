import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class WinnersNotifier extends StateNotifier<int> {
  WinnersNotifier(this.pref) : super(pref?.getInt('winners') ?? 1);

  final SharedPreferences? pref;

  void toggleWinnersStatus(int numberOfWinners) {
    state = numberOfWinners;
    pref!.setInt('winners', numberOfWinners);
  }
}

final winnersProvider = StateNotifierProvider<WinnersNotifier, int>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return WinnersNotifier(pref);
});
