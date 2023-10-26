import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/creador_palabras.dart';

class ParejasGame extends StatefulWidget {
  const ParejasGame({Key? key}) : super(key: key);
  @override
  State<ParejasGame> createState() => _ParejasGame();
}

class _ParejasGame extends State<ParejasGame> {
  //!Variables
  List<String> palabrasA = ["pal1", "pal2", "pal3", "pal4", "pal5"];
  List<String> palabrasB = ["pal4", "pal3", "pal2", "pal5", "pal1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!Barra superior
      appBar: AppBar(
        title: const Text(
          "StudyBuddy",
          style: TextStyle(
            fontFamily: "Chewy",
            fontSize: 32,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: azulClaro,
      ),

      //!Cuerpo
      body: Column(
        children: [
          //!Barra superior con opcion de salida
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: azulOscuro),
                child: const Center(
                  child: Text("Parejas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(width: 105),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel, color: rojo, size: 37),
              )
            ],
          ),
          const SizedBox(height: 25),

          //!Cuerpo del juego
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                Expanded(
                  child: ListView.builder(
                      itemCount: palabrasA.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: CreaPalabras(
                              palabra: palabrasA[index],
                              onTap: () {
                                setState(() {
                                });
                              },
                            ));
                      }),

                ),

                const SizedBox(width: 35),

                Expanded(
                  child: ListView.builder(
                      itemCount: palabrasB.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: CreaPalabras(
                              palabra: palabrasB[index],
                              onTap: () {
                                setState(() {
                                });
                              },
                            ));
                      }),
                ),

              ],
            ),
          ),
          const BarraInferior(),
        ],
      ),
    );
  }
}
