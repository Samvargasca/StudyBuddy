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
                    CreaPalabras(palabra: 'Gato'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'Ave'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'negro'),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreaPalabras(palabra: 'blue'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'hello'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'Bird'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'black'),
                    SizedBox(height: 20),
                    CreaPalabras(palabra: 'Cat'),
                  ],
                ),

              ],
            ),
          ),
          BarraInferior(),
        ],
      ),
    );
  }
}


class CreaPalabras extends StatelessWidget {
  final String palabra;
  final int? clave;

  const CreaPalabras({
    super.key, 
    required this.palabra, 
    this.clave
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          
        },

        style: ElevatedButton.styleFrom(
          backgroundColor:Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: const BorderSide(color: azulRey, width: 4),
        ),
        
        child: Text(
          palabra,
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
