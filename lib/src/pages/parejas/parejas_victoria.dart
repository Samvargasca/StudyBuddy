import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';

class ParejasVictoriaPage extends StatefulWidget { //?Esta pagina podria ser StatelessWidget
  const ParejasVictoriaPage({super.key});

  @override
  State <ParejasVictoriaPage> createState() => _ParejasVictoriaPage();
}

class _ParejasVictoriaPage extends State<ParejasVictoriaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!Titulo de la pagina 
      appBar: AppBar(
        title: const Text("StudyBuddy", style: TextStyle( fontFamily: "Chewy", fontSize: 32)),
        automaticallyImplyLeading: false,
        backgroundColor: azulClaro
      ),

      //!Cuerpo de la pagina
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        //!Titulo de la dinamica y boton de salida 
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),

        //!Cuerpo de la pagina, titulo imagen, parrafo y boton de inicio
          //Texto de pagina
          const Text( "¡Felicidades!", style: TextStyle(fontFamily: "Chewy", fontSize: 48)),

          Image.asset( "assets/images/quokka-copa.png", width: 186),

          const SizedBox(
            width: 185,
            child: Text(
              "!lo lograste¡\n\n¡Has encontrado todas las parejas!",
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
          SizedBox(
            width: 200,
            height: 57,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: azulRey,
              ),
              child: const Text(
                "jugar de nuevo",
                style: TextStyle(
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),

          SizedBox(
            width: 200,
            height: 57,
            child: ElevatedButton(
              onPressed: () => 
              Navigator.popUntil(context, ModalRoute.withName("/")), //Volver al inicio
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: azulRey,
              ),
              child: const Text(
                "Regresa al menu",
                style: TextStyle(
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          const BarraInferior(),
        ],
      ),
    );
  }
}
