import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:study_buddy/src/services/firebase_service.dart";
import "package:study_buddy/src/services/firestore_service.dart";
import 'package:study_buddy/src/constants/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(context) {
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
                const Text("G*ADSAfdbx ,dsm"),
                Image.asset(
                  // Modificar con diseño correspondiente
                  "assets/icon/icon.png",
                ),

                FormularioRegistro(),

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

class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({super.key});

  @override
  State<FormularioRegistro> createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  // Controladores del texto
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Llave del formulario
  final _formKey = GlobalKey<FormState>();

  bool _invisiblePassword = true;
  bool _invisibleConfirmedPassword = true;

  // Variables donde se guardará la información del formulario
  String _user = "";
  String _email = "";
  String _password = "";

  bool _isShowingSnackbar = false;

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);
    FirestoreService firestoreService = Provider.of<FirestoreService>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
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
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _userController,
                    onSaved: (newValue) => _user = newValue ?? "",
                    decoration: InputDecoration(
                      labelText: "Usuario",
                      suffixIcon: IconButton(
                        onPressed: () {
                          _userController.clear();
                          print("hola");
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce un usuario";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onSaved: (newValue) => _email = newValue ?? "",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce un correo";
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
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _invisiblePassword,
                    onSaved: (newValue) => _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce una contraseña";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Contraseña",
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
                  TextFormField(
                    obscureText: _invisibleConfirmedPassword,
                    onSaved: (newValue) => _password = newValue ?? "",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce una contraseña";
                      }
                      if (value != _passwordController.text) {
                        return "Las contraseñas no coinciden";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Confirmar Contraseña",
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          _invisibleConfirmedPassword =
                              !_invisibleConfirmedPassword;
                        }),
                        icon: _invisibleConfirmedPassword
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
            style: ElevatedButton.styleFrom(
              // Modificar con diseño correspondiente
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(double.infinity, 0),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                FocusScope.of(context).unfocus(); // Desenfoca el campo de texto
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
                try {
                  await firebaseService.createUserWithEmailAndPassword(
                      _email, _password);
                  await firestoreService.createUser(
                      firebaseService.user!.uid, _user);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Usuario creado"),
                      ),
                    );
                    Navigator.pop(context);
                  }
                  await Future.delayed(const Duration(milliseconds: 2000));
                  if (context.mounted) {
                    Navigator.pushNamed(context, "/login");
                  }
                } catch (e) {
                  if (firebaseService.user != null) {
                    await firebaseService.deleteUser(firebaseService.user);
                  }
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  if (!_isShowingSnackbar) {
                    _isShowingSnackbar = true;
                    if (context.mounted) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          )
                          .closed
                          .then((_) => _isShowingSnackbar = false);
                    }
                  }
                }
              }
            },
            child: const Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
