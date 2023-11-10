import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.circle_outlined,
      size: 150,
      color: Colors.white,
    );
  }
}
