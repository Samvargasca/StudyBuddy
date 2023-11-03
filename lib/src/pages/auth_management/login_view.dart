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
  final _formKey = GlobalKey<FormState>();
  bool validEmail = false;
  bool invisiblePassword = true;
  bool isShowingSnackBar = false;

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
                FormularioInicioSesion(formKey: _formKey),
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
                ElevatedButton(
                  onPressed: () {
                    try {
                      firebaseService.signOut();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                          duration: const Duration(milliseconds: 300),
                        ));
                      }
                    }
                  },
                  child: const Text("Log Out"),
                ),
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

class FormularioInicioSesion extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormularioInicioSesion({super.key, required this.formKey});

  @override
  State<FormularioInicioSesion> createState() => _FormularioInicioSesionState();
}

class _FormularioInicioSesionState extends State<FormularioInicioSesion> {
  GlobalKey<FormState>? _formKey;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _invisiblePassword = true;
  String _email = "";
  String _password = "";
  var currentContext;

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);
    _formKey = widget.formKey;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(firebaseService.user?.email ?? "No hay usuario"),
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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onSaved: (newValue) => _email = newValue ?? "",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce texto";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Introduce un correo válido";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      suffixIcon: IconButton(
                          onPressed: () => _emailController.clear(),
                          icon: const Icon(Icons.close)),
                    ),
                  ),
                  TextFormField(
                    obscureText: _invisiblePassword,
                    onSaved: (newValue) => _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce una contraseña";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          _invisiblePassword = !_invisiblePassword;
                        }),
                        icon: _invisiblePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            // Modificar con diseño correspondiente
            onPressed: () async {
              if (_formKey!.currentState!.validate()) {
                showDialog(
                  context: context,
                  barrierDismissible:
                      false, // Impide cerrar la pantalla de carga con un tap afuera
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(), // Pantalla de carga
                    );
                  },
                );
                // try {
                await firebaseService.signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                Navigator.pushNamed(context, "/home");
                // } catch (e) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text(e.toString()),
                //     ),
                //   );
                // } finally {
                Navigator.pop(context);
                // }
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
        ],
      ),
    );
  }
}
