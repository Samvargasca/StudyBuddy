// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_buddy/src/colors/colors.dart';
import 'package:study_buddy/src/pages/parejas_page.dart';
import 'package:study_buddy/src/pages/traduccion/traduccion_page.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BotonInicio(
                            "Parejas",
                            "¡Aprende juntando las palabras con sus traducciones!",
                            SvgPicture.asset(
                              "assets/images/squares-2x2-solid.svg",
                              width: 65,
                            ),
                          ),
                          const SizedBox(height: 20),
                          BotonInicio(
                            "Traducir",
                            "¡Practica completando las traducciones de las palabras!",
                            Image.asset(
                              "assets/images/traducir.png",
                              width: 65,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const BarraInferior(),
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
  const BotonInicio(this.titulo, this.descripcion, this.icono, {super.key});

  final String titulo;
  final String descripcion;
  final Widget? icono;

  dynamic nextPage() {
    switch (titulo) {
      case "Parejas":
        return const ParejasPage();
      case "Traducir":
        return const TraduccionPage();
      default:
        return const TraduccionPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navegar a la segunda página cuando se presiona el botón
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => nextPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: azulRey, width: 2),
        ),
        fixedSize: const Size(267, 98),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icono == null ? Container() : icono!,
          SizedBox(width: icono == null ? 0 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontFamily: "Chewy",
                    fontSize: 24,
                    color: azulOscuro,
                  ),
                ),
                Text(
                  descripcion,
                  style: const TextStyle(
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
