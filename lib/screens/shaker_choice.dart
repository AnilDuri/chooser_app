import 'dart:math';

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
    return ShakerChoiceInner(winners: winners);
  }
}

class ShakerChoiceInner extends StatefulWidget {
  const ShakerChoiceInner({super.key, required this.winners});
  final int winners;

  @override
  State<ShakerChoiceInner> createState() => _ShakerChoiceInnerState();
}

class _ShakerChoiceInnerState extends State<ShakerChoiceInner> {
  final _nameController = TextEditingController();
  final List<String> _names = [];
  late ShakeDetector _detector;

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
    var rand = Random();
    int i = rand.nextInt(_names.length);

//remove the random string
    setState(() {
      _names.removeAt(i);
    });
    HapticFeedback.heavyImpact();
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

    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shaker'),
      ),
      backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add people to your list and start shaking to see who remains',
              textAlign: TextAlign.center,
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
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(_names[index]),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _names.remove(_names[index]);
                      });
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
