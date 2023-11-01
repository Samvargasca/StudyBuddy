import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:study_buddy/src/services/firebase_service.dart";
import 'package:study_buddy/src/constants/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  bool validEmail = false;
  bool invisiblePassword = true;
  bool invisibleConfirmedPassword = true;
  late var currentContext;

  @override
  Widget build(context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);

    return Scaffold(
      backgroundColor: azulClaro,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Cerrar teclado
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50), // Modificar con diseño correspondiente
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("G*ADSAfdbx ,dsm"),
                Image.asset(
                  // Modificar con diseño correspondiente
                  "assets/icon/icon.png",
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Modificar con diseño correspondiente
                    child: Column(
                      children: [
                        const Text(
                            "Registro"), // Modificar con diseño correspondiente
                        const Text(
                            "¡Bienvenido a una nueva experiencia de aprendizaje!"), // Modificar con diseño correspondiente
                        TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Usuario",
                          ),
                          controller: _userController,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              validEmail = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                            });
                          },
                          decoration: InputDecoration(
                              labelText: "Email",
                              suffixIcon:
                                  Icon(validEmail ? Icons.check : Icons.close)),
                          controller: _emailController,
                        ),
                        TextField(
                          obscureText: invisiblePassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                invisiblePassword = !invisiblePassword;
                              }),
                              icon: invisiblePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                          controller: _passwordController,
                        ),
                        TextField(
                          obscureText: invisibleConfirmedPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Confirmar contraseña",
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                invisibleConfirmedPassword =
                                    !invisibleConfirmedPassword;
                              }),
                              icon: invisibleConfirmedPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                          controller: _passwordConfirmationController,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  // Modificar con diseño correspondiente
                  onPressed: () async {
                    currentContext = context;
                    try {
                      await firebaseService.createUserWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Usuario creado"),
                        ),
                      );
                      Navigator.pushNamed(currentContext, "/login");
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // Modificar con diseño correspondiente
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: const Text("Registrarse"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      // Modificar con diseño correspondiente
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      // onPressed: () {
                      //   try {
                      //     firebaseService.createUserWithEmailAndPassword(
                      //         _emailController.text, _passwordController.text);
                      //   } catch (e) {
                      //     if (context.mounted) {
                      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //         content: Text(e.toString()),
                      //         duration: const Duration(milliseconds: 300),
                      //       ));
                      //     }
                      //   }
                      //   print(_passwordController.text);
                      // },
                      child: const Text("Iniciar Sesión")),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       try {
                //         firebaseService.signOut();
                //       } catch (e) {
                //         if (context.mounted) {
                //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             content: Text(e.toString()),
                //             duration: const Duration(milliseconds: 300),
                //           ));
                //         }
                //       }
                //       print(_passwordController.text);
                //     },
                //     child: const Text("Log Out"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
