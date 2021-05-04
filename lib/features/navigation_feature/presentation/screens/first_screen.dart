import 'package:flutter/material.dart';
import 'package:navigator_test/core/app/navigator/navigator.dart';
import 'package:navigator_test/features/navigation_feature/presentation/screens/second_screen.dart';

class FirstScreen extends StatefulWidget with NavigatedScreen {
  @override
  _FirstScreenState createState() => _FirstScreenState();

  String get routeName => 'first_screen';
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            SecondScreen(
              text: 'second_screen',
            ).addScreen(context);
          },
          child: Text('next screen'),
        ),
      ),
    );
  }
}
