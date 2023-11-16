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
                'Add people to your list and start shaking to determe the starting order',
                textAlign: TextAlign.center,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: _nameController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
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
                              icon: const Icon(Icons.remove_circle_outline)),
                        )),
              )
            ],
          )),
    );
  }
}
