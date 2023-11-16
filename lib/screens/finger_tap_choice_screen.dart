import 'package:chooser_ap/screens/home.dart';
import 'package:chooser_ap/widgets/circle.dart';
import 'package:chooser_ap/widgets/touch_indicator.dart';
import 'package:flutter/material.dart';

class FingerTapChoiceScreen extends StatelessWidget {
  const FingerTapChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TouchIndicator(
      indicator: const Circle(),
      indicatorSize: 150,
      child: Scaffold(
        appBar: AppBar(title: const Text('Finger Chooser')),
        backgroundColor: Colors.amberAccent,
        body: Column(
          children: [
            const Column(
              children: [
                Text(
                  'Chooser 2.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your random selector.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeButton(
                  icon: Icons.help,
                  label: 'Tutorial',
                  onTap: () {},
                ),
                HomeButton(
                  icon: Icons.brush,
                  label: 'Color',
                  onTap: () {},
                ),
                HomeButton(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
