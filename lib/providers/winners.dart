import 'package:flutter_riverpod/flutter_riverpod.dart';

class WinnersNotifier extends StateNotifier<int> {
  WinnersNotifier() : super(1);

  void toggleWinnersStatus(int numberOfWinners) {
    state = numberOfWinners;
  }
}

final winnersProvider = StateNotifierProvider<WinnersNotifier, int>((ref) {
  return WinnersNotifier();
});
