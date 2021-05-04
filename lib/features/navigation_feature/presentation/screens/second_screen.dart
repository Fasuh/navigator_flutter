import 'package:flutter/material.dart';
import 'package:navigator_test/core/app/navigator/navigator.dart';
import 'package:navigator_test/features/navigation_feature/presentation/screens/first_screen.dart';

class SecondScreen extends StatefulWidget with NavigatedScreen {
  final String text;

  const SecondScreen({Key? key, required this.text}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();

  String get routeName => 'second_screen';
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              FirstScreen().setAsBaseScreen();
            },
            child: Text(widget.text)),
      ),
    );
  }
}
