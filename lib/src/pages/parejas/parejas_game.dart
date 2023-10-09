import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';

class ParejasGame extends StatefulWidget {
  const ParejasGame({Key? key}) : super(key: key);
  @override
  State<ParejasGame> createState() => _ParejasGame();
}

class _ParejasGame extends State<ParejasGame> {
  //!Variables
  List<String> palabrasA = ["Hola", "Azul", "Gato", "Ave", "Negro"];
  List<String> palabrasB = ["Blue", "Hello", "Bird", "Cat", "Black"];
  String A = " ";
  String B = " ";

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
              Container( height: 35, width: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: azulOscuro),
                child: const Center(
                  child: Text( "Parejas", textAlign: TextAlign.center, style: TextStyle( fontFamily: "Arimo", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            const SizedBox(width: 105),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon( Icons.cancel, color: rojo, size: 37 ),
              )
            ],
          ),
          const SizedBox(height: 25),

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
                                  A = palabrasA[index];
                                  if (A == B) {
                                    palabrasA.remove(A);
                                  } else {
                                  }
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
                                  B = palabrasB[index];
                                  if (A == B) {
                                    palabrasB.remove(B);
                                  }
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
class CreaPalabras extends StatefulWidget {
  final String palabra;
  final int? clave;
  final Function onTap;

  const CreaPalabras(
      {super.key, required this.palabra, this.clave, required this.onTap});

  @override
  State<CreaPalabras> createState() => _CreaPalabras();
}

class _CreaPalabras extends State<CreaPalabras> {
  Color colorButton = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap();
          setState(() {
            colorButton = Colors.blue;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: const BorderSide(color: azulRey, width: 4),
        ),
        child: Text(
          widget.palabra,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Arimo",
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
      ),
    );
  }
}




