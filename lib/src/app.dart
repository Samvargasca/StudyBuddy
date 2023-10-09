import 'package:flutter/material.dart';
import 'package:study_buddy/src/pages/my_home_page.dart';
import 'package:study_buddy/src/pages/traduccion/errores_page.dart';
import 'package:study_buddy/src/pages/traduccion/traduccion_page.dart';
import 'package:study_buddy/src/pages/traduccion/traduccion_ejercicio_page.dart';
import 'package:study_buddy/src/pages/traduccion/palabra_page.dart';
import 'package:study_buddy/src/pages/parejas/parejas_page.dart';
import 'package:study_buddy/src/pages/parejas/parejas_game.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Study Buddy",
      debugShowCheckedModeBanner: false,
      initialRoute: "/", // Ruta inicial
      routes: {
        "/": (context) => const MyHomePage(
            title: "Study Buddy"), // Ruta de la pagina principal
        "/traduccion": (context) =>
            const TraduccionPage(), // Ruta de la pagina de traduccion
        "/traduccion/ejercicio": (context) =>
            const TraduccionEjercicioPage(), // Ruta de la pagina de ejercicio de traduccion
        "/traduccion/errores": (context) =>
            const ErroresPage(), // Ruta de la pagina de errores de traduccion
        "/traduccion/palabra": (context) =>
            const PalabraPage(), // Ruta de la pagina de palabra individual
        "/parejas": (context) =>
            const ParejasPage(), // Ruta de la pagina de parejas
        "/parejas/game": (context) =>
            const ParejasGame(), // Ruta de la pagina de juego de parejas
      },
    );
  }
}
