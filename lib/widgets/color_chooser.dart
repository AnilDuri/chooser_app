import 'package:chooser_app/providers/color_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChooser extends ConsumerStatefulWidget {
  const ColorChooser({super.key});

  @override
  ConsumerState<ColorChooser> createState() => _ColorChooserState();
}

class _ColorChooserState extends ConsumerState<ColorChooser> {
  @override
  Widget build(BuildContext context) {
    final colorsList = ref.watch(colorChoiceProvider);
    return CupertinoListSection(
      header: const Text(
        'Mono Tones',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: colorsList
                .map((item) => GestureDetector(
                      onTap: () {
                        ref
                            .read(colorChoiceProvider.notifier)
                            .toggleColorChoice(item.color);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        padding: const EdgeInsets.all(8),
                        width: 140,
                        height: 160,
                        decoration: BoxDecoration(
                          color: item.color,
                          border: item.selected
                              ? Border.all(width: 3, color: Colors.white)
                              : null,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
