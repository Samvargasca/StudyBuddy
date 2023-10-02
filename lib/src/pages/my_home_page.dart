import 'package:flutter/material.dart';
import 'package:study_buddy/src/colors/colors.dart';
import 'package:study_buddy/src/pages/traduccion/traduccion_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
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
        child: Column(
          children: [
            const Expanded(
              child: Text("Palabra"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a la segunda página cuando se presiona el botón
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TraduccionPage(),
                  ),
                );
              },
              child: Text("Traducción"),
            )
          ],
        ),
      ),
    );
  }
}
