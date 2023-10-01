import 'package:flutter/material.dart';
import 'package:study_buddy/src/colors/colors.dart';
import 'package:flutter_svg/svg.dart';

class TraduccionPage extends StatefulWidget {
  const TraduccionPage({Key? key}) : super(key: key);

  @override
  _TraduccionPageState createState() => _TraduccionPageState();
}

class _TraduccionPageState extends State<TraduccionPage> {
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
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 36,
                width: 93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulOscuro,
                ),
                child: const Center(
                  child: Text(
                    "Traducir",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Arimo",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.cancel,
                  color: rojo,
                  size: 37,
                ),
              )
            ],
          ),
          const Text(
            "¡Practiquemos!",
            style: TextStyle(fontFamily: "Chewy", fontSize: 48),
          ),
          Image.asset(
            "assets/images/quokka-papeles.png",
            width: 186,
          ),
          const SizedBox(
            width: 185,
            child: Text(
              "Escribe y completa las traducciones de las palabras.",
              style: TextStyle(
                fontFamily: "Aribo",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: gris,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 147,
            height: 57,
            child: ElevatedButton(
              onPressed: () {
                print("hola");
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
          Container(
            width: 302,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: azulClaro,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.home,
                      color: azulRey,
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "assets/images/cards.svg",
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "assets/images/trophy-fill.svg",
                      colorFilter: const ColorFilter.mode(
                        azulRey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "assets/images/high-bars.svg",
                      colorFilter: const ColorFilter.mode(
                        azulRey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "assets/images/account.svg",
                      colorFilter: const ColorFilter.mode(
                        azulRey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
