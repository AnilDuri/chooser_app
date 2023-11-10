import 'package:chooser_ap/widgets/touch_indicator.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return TouchIndicator(
      indicator: const Icon(
        Icons.circle_outlined,
        size: 150,
        color: Colors.white,
      ),
      indicatorSize: 150,
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'Welcome To Chooser',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Random selector',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
