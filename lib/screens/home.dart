import 'package:chooser_app/screens/finger_tap_choice_screen.dart';
import 'package:chooser_app/screens/shaker_choice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _choiceController = 'shaker';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Chooser 2.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Your random selector.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _choiceController,
                      items: const [
                        DropdownMenuItem(
                            value: 'finger', child: Text('Finger Chooser')),
                        DropdownMenuItem(
                            value: 'shaker', child: Text('Shaker Chooser')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _choiceController = value!;
                        });
                      },
                      dropdownColor: Colors.amber,
                      elevation: 0,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 40,
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
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
                ),
                HomeButton(
                  icon: Icons.navigate_next,
                  label: 'Continue',
                  onTap: () {
                    if (_choiceController == 'shaker') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const ShakerChoiceScreen(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const FingerTapChoiceScreen(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  final IconData icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
