import 'package:chooser_app/providers/winners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    final winners = ref.watch(winnersProvider);
    return Column(
      children: [
        Text(
          winners.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(winnersProvider.notifier).toggleWinnersStatus(2);
          },
          child: Text('Click Me'),
        ),
      ],
    );
  }
}
