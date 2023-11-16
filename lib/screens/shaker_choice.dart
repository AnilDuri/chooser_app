import 'package:flutter/material.dart';

class ShakerChoiceScreen extends StatefulWidget {
  const ShakerChoiceScreen({super.key});

  @override
  State<ShakerChoiceScreen> createState() {
    return _ShakerChoiceScreen();
  }
}

class _ShakerChoiceScreen extends State<ShakerChoiceScreen> {
  final _nameController = TextEditingController();
  final List<String> _names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add people to your list and start shaking to determing who remains',
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _nameController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final enteredName = _nameController.text;
                if (enteredName.isEmpty) {
                  return;
                }
                setState(() {
                  _names.add(_nameController.text);
                });

                _nameController.clear();
              },
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
                      )),
            )
          ],
        ),
      )),
    );
  }
}
