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
            1: SegmentSelector(
              value: '1',
            ),
            2: SegmentSelector(
              value: '2',
            ),
            3: SegmentSelector(
              value: '3',
            ),
            4: SegmentSelector(
              value: '4',
            ),
            5: SegmentSelector(
              value: '5',
            ),
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

class SegmentSelector extends StatelessWidget {
  const SegmentSelector({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        value,
        style: const TextStyle(color: CupertinoColors.white),
      ),
    );
  }
}
