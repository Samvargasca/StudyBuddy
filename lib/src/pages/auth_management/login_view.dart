import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:study_buddy/src/services/firebase_service.dart";
import 'package:study_buddy/src/constants/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool validEmail = false;
  bool invisiblePassword = true;
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
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                // This SizedBox helps to push items towards the center of the screen
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

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
                            "Iniciar sesión"), // Modificar con diseño correspondiente
                        const Text(
                            "¡Hola, qué gusto verte de nuevo!"), // Modificar con diseño correspondiente
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
                          decoration: InputDecoration(
                            labelText: "Password",
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
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  // Modificar con diseño correspondiente
                  onPressed: () async {
                    currentContext = context;
                    try {
                      await firebaseService.signInWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      Navigator.pushNamed(currentContext, "/home");
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
                  child: const Text("Log In"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      // Modificar con diseño correspondiente
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
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
                      child: const Text("Sign Up")),
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
                // This SizedBox helps to push items towards the center of the screen
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
