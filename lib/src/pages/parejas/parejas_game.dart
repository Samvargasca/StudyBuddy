import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';

class ParejasGame extends StatefulWidget {
  const ParejasGame({Key? key}) : super(key: key);
  @override
  State <ParejasGame> createState() => _ParejasGame();
}

class _ParejasGame extends State<ParejasGame> {
  //!Variables
  int clickcounter = 0;

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
        automaticallyImplyLeading: false,
        backgroundColor: azulClaro,
      ),

      body: const Column(
        children: [
        Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CreaPalabras(palabra: 'hola'),
                SizedBox(height: 20),
                CreaPalabras(palabra: 'azul'),
                SizedBox(height: 20),
                CreaPalabras(palabra: 'azul'),
                SizedBox(height: 20),
                CreaPalabras(palabra: 'azul'),
                SizedBox(height: 20),
                CreaPalabras(palabra: 'azul'),

              ],

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              CreaPalabras(palabra: 'hello'),
              SizedBox(height: 20),
              CreaPalabras(palabra: 'blue'),
              SizedBox(height: 20),
              CreaPalabras(palabra: 'blue'),
              SizedBox(height: 20),
              CreaPalabras(palabra: 'blue'),
              SizedBox(height: 20),
              CreaPalabras(palabra: 'blue'),                            

              ],
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

class CreaPalabras extends StatelessWidget {
  final String palabra;

  const CreaPalabras({
    super.key, 
    required this.palabra,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( width: 140, height: 100, 
    child: ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
          backgroundColor: azulRey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        child: Text(
          palabra,
          style: const TextStyle(
              fontFamily: "Arimo",
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
      ),
    );
  }
}


