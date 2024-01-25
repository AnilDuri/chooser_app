import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('stackoverflow playground'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CupertinoFullscreenDialogTransition(
                primaryRouteAnimation: _animationController,
                secondaryRouteAnimation: _animationController,
                linearTransition: false,
                child: Center(
                  child: Container(
                    color: Colors.blueGrey,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _animationController.forward(),
                    child: Text('forward'),
                  ),
                  TextButton(
                    onPressed: () => _animationController.reverse(),
                    child: Text('reverse'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
