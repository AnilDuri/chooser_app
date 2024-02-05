import 'dart:math';

import 'package:chooser_app/constants/colors.dart';
import 'package:chooser_app/providers/color_choice.dart';
import 'package:chooser_app/providers/winners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shake/shake.dart';

class ShakerChoiceScreen extends ConsumerStatefulWidget {
  const ShakerChoiceScreen({super.key});

  @override
  ConsumerState<ShakerChoiceScreen> createState() {
    return _ShakerChoiceScreen();
  }
}

class _ShakerChoiceScreen extends ConsumerState<ShakerChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final winners = ref.watch(winnersProvider);
    final String selected = ref.watch(colorChoiceProvider);
    final color =
        combinedColors.firstWhere((element) => element.id == selected);

    return ShakerChoiceInner(winners: winners, colors: color.color);
  }
}

class ShakerChoiceInner extends StatefulWidget {
  const ShakerChoiceInner(
      {super.key, required this.winners, required this.colors});
  final int winners;
  final List<MaterialColor> colors;

  @override
  State<ShakerChoiceInner> createState() => _ShakerChoiceInnerState();
}

class _ShakerChoiceInnerState extends State<ShakerChoiceInner> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _names = [];
  late ShakeDetector _detector;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        print('Shaking');
        if (_names.length < widget.winners) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Please add more people. You need at least ${widget.winners + 1} people!'),
            ),
          );
          return;
        }
        randomlyRemoveName();
        // Do stuff on phone shake
      },
      minimumShakeCount: 2,
      shakeSlopTimeMS: 1000,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  void randomlyRemoveName() {
    if (_names.length == widget.winners) {
      print('These are your winners');
      _detector.stopListening();
      return;
    }

    //remove random name
    var rand = Random();
    int i = rand.nextInt(_names.length);
    removeName(i);
    HapticFeedback.heavyImpact();
  }

  void removeName(int index) {
    final removedItem = _names[index];

    setState(() {
      _names.removeAt(index);
    });
    _listKey.currentState?.removeItem(
        index, (ctx, animation) => buildItem(removedItem, animation));
  }

  @override
  void dispose() {
    _detector.stopListening();
    super.dispose();
  }

  void _savePerson() {
    final enteredName = _nameController.text;
    if (enteredName.isEmpty) {
      return;
    }
    if (_names.contains(enteredName)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Name already exists'),
        ),
      );
      return;
    }

    setState(() {
      _names.add(_nameController.text);
    });
    _listKey.currentState?.insertItem(_names.length - 1);
    _nameController.clear();
  }

  Widget buildItem(String name, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(name),
        trailing: IconButton(
          onPressed: () => removeName(_names.indexOf(name)),
          icon: const Icon(Icons.remove_circle_outline),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: _nameController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _savePerson,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: const Size(150, 40)),
              child: const Text(
                'Add Person',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _names.length,
                itemBuilder: (ctx, index, animation) =>
                    buildItem(_names[index], animation),
              ),
            )
          ],
        ),
      ),
    );
  }
}
