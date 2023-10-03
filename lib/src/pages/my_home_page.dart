import 'package:flutter/material.dart';
import 'package:study_buddy/src/colors/colors.dart';
import 'package:study_buddy/src/pages/parejas_page.dart';
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
      backgroundColor: azulClaro,
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra los elementos verticalmente
        children: [
          const Expanded(
            child: Text("¿Palabra?"),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navegar a la segunda página cuando se presiona el botón
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TraduccionPage(),
                          ),
                        );
                      },
                      child: const Text("Traducción"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ParejasPage(),
                          ),
                        ); // Agrega aquí la acción para el botón "Parejas"
                        // Por ejemplo, puedes navegar a una página diferente
                      },
                      child: Text("Parejas"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
