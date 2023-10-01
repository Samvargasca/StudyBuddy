import 'package:flutter/material.dart';
import 'package:study_buddy/src/colors/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StudyBuddy"),
        backgroundColor: azulClaro,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: azulClaro,
        child: const Column(
          children: [
            Expanded(
              child: Text("Palabra"),
            ),
          ],
        ),
      ),
    );
  }
}
