import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/flashcard.dart';

class TraduccionEjercicioPage extends StatefulWidget {
  const TraduccionEjercicioPage({Key? key}) : super(key: key);

  @override
  _TraduccionEjercicioPageState createState() =>
      _TraduccionEjercicioPageState();
}

class _TraduccionEjercicioPageState extends State<TraduccionEjercicioPage> {
  String ingles = "hello";
  String traduccion = "hola";
  String significado = "Saludo Casual";
  String imagenAsset = "assets/images/quokka-pregunta.png";

  void cambiarImagen(String nuevaRuta) {
    setState(() {
      imagenAsset = nuevaRuta;
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
                onPressed: () =>
                    Navigator.pop(context), // Volver a la página anterior
                icon: const Icon(
                  Icons.cancel,
                  color: rojo,
                  size: 37,
                ),
              ),
            ],
          ),
          Flashcard(
            pregunta: ingles,
            respuesta: significado,
          ),
          const SizedBox(
            width: 350,
            child: Text(
              "Completa:",
              style: TextStyle(
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: gris,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Formulario(traduccion, cambiarImagen),
          Image.asset(
            imagenAsset,
            width: 159,
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, "/traduccion/errores"),
            style: ElevatedButton.styleFrom(
              backgroundColor: amarillo,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: const Text(
              "Ver Errores",
              style: TextStyle(
                color: azulOscuro,
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BarraInferior(),
        ],
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario(this.traduccion, this.cambiarImagen, {super.key});
  final String traduccion;
  final Function(String) cambiarImagen;

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controladorTexto = TextEditingController();

  bool editar = true;

  @override
  void dispose() {
    controladorTexto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 255,
            child: TextFormField(
              controller: controladorTexto,
              decoration: const InputDecoration(
                hintText: 'Escribe la traducción en español',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: azulOscuro,
                    width: 4,
                  ),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Escribe la traducción en español';
                }
                return null;
              },
              enabled: editar,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 59,
            height: 59,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: azulOscuro,
            ),
            child: IconButton(
              onPressed: editar
                  ? () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        String mensaje;
                        String palabraUsuario = controladorTexto.text;

                        if (widget.traduccion.toLowerCase() ==
                            palabraUsuario.toLowerCase()) {
                          mensaje = "Correcto";
                          widget.cambiarImagen("assets/images/quokka-copa.png");
                        } else {
                          mensaje = "Incorrecto";
                        }
                        // Process data.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(mensaje),
                          ),
                        );

                        setState(
                          () {
                            editar = false;
                          },
                        );
                      }
                    }
                  : null,
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
