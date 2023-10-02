import 'package:flutter/material.dart';
import 'package:study_buddy/src/colors/colors.dart';

class ParejasGame extends StatefulWidget {
  const ParejasGame({Key? key}) : super(key: key);

  @override
  _ParejasGame createState() => _ParejasGame();
}

class _ParejasGame extends State<ParejasGame> {
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
        shadowColor: Color.fromARGB(82, 0, 0, 0),
      ),
      body: Column(


        //Se encarga de centrar los elementos verticalmente
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),

          //Texto de pagina
          const Text(
            "ESTE ES EL JUEGOOO!",

            style: TextStyle(fontFamily: "Chewy", fontSize: 48),
          ),
          Image.asset(
            "assets/images/quokka-papeles.png",
            width: 186,
          ),
          const SizedBox(
            width: 185,
            child: Text(
              "¿Listo para formar parejas?",
              style: TextStyle(
                fontFamily: "Aribo",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: gris,
              ),
              textAlign: TextAlign.center,
            ),
          ),


          //Boton de inicio
          Container(
            width: 147,
            height: 57,
            child: ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: azulRey,
              ),

              child: const Text(
                "Iniciar",
                style: TextStyle(
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),


            ),
          ),
        ],
      ),
    );
  }
}
