import 'package:chooser_app/providers/winners.dart';
import 'package:flutter/cupertino.dart';
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
        CupertinoSlidingSegmentedControl(
          backgroundColor: Colors.white10,
          thumbColor: Colors.white54,
          groupValue: winners,
          children: const <int, Widget>{
            1: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '1',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            2: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '2',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            3: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '3',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            4: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '4',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            5: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '5',
                style: TextStyle(color: CupertinoColors.white),
              ),
            )
          },
          onValueChanged: (value) {
            if (value != null) {
              ref.read(winnersProvider.notifier).toggleWinnersStatus(value);
            }
          },
        ),
      ],
    );
  }
}
