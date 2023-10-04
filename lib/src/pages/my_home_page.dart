// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/flashcard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numeroPalabra = 1;
  int max = 99;

  void aumentarPalabra() {
    setState(() {
      numeroPalabra = (numeroPalabra % max) + 1;
    });
  }

  void disminuirPalabra() {
    setState(() {
      numeroPalabra = (numeroPalabra - 1) % max;
      if (numeroPalabra < 1) {
        numeroPalabra = max;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "StudyBuddy",
          style: TextStyle(
            fontFamily: "Chewy",
            fontSize: 32,
          ),
        ),
        backgroundColor: azulClaro,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: azulClaro,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flashcard(
                      pregunta: "Pregunta $numeroPalabra",
                      respuesta: "Respuesta $numeroPalabra",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: -90 * 3.141592 / 180,
                          child: IconButton(
                            onPressed: () => disminuirPalabra(),
                            icon: SvgPicture.asset(
                              width: 24,
                              "assets/images/up-arrow.svg",
                              colorFilter: const ColorFilter.mode(
                                azulOscuro,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 21,
                          decoration: BoxDecoration(
                            color: azulRey,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "$numeroPalabra/$max",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 90 * 3.141592 / 180,
                          child: IconButton(
                            onPressed: () => aumentarPalabra(),
                            icon: SvgPicture.asset(
                              width: 24,
                              "assets/images/up-arrow.svg",
                              colorFilter: const ColorFilter.mode(
                                azulOscuro,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
          Positioned(
            top: 1,
            bottom: 1,
            right: -10,
            child: Image.asset(
              "assets/images/quokka-papeles.png",
              width: 150,
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

  // Obtener la siguiente ruta
  String nextPage() {
    switch (titulo) {
      case "Parejas":
        return "/parejas";
      case "Traducir":
        return "/traduccion";
      default:
        return "/";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          () => // Navegar a la siguiente página cuándo se presiona el botón
              Navigator.pushNamed(context, nextPage()),
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
