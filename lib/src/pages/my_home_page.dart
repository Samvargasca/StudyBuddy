// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                    const BotonInicio(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ParejasPage(),
                          ),
                        ); // Agrega aquí la acción para el botón "Parejas"
                        // Por ejemplo, puedes navegar a una página diferente
                      },
                      child: const Text("Parejas"),
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

class BotonInicio extends StatelessWidget {
  const BotonInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navegar a la segunda página cuando se presiona el botón
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TraduccionPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(267, 98),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/images/squares-2x2-solid.svg",
            width: 65,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Parejas",
                  style: TextStyle(
                    fontFamily: "Chewy",
                    fontSize: 24,
                    color: azulOscuro,
                  ),
                ),
                Text(
                  "¡Aprende juntando las palabras con sus traducciones!",
                  style: TextStyle(
                    color: gris,
                    fontSize: 12,
                    fontFamily: "Arimo",
                  ),
                  softWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
