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
  final _formKey = GlobalKey<FormState>();
  bool validEmail = false;
  bool invisiblePassword = true;
  bool invisibleConfirmedPassword = true;
  bool _isCreatingUser = false;
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
                const Text("G*ADSAfdbx ,dsm"),
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
                        FormularioRegistro(formKey: _formKey),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  // Modificar con diseño correspondiente
                  onPressed: () async {
                    setState(() {
                      _isCreatingUser = true;
                    });
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
                    } finally {
                      setState(() {
                        _isCreatingUser = false;
                      });
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
                  child: _isCreatingUser
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Registrarse"),
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

class FormularioRegistro extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormularioRegistro({super.key, required this.formKey});

  @override
  State<FormularioRegistro> createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  // Controladores del texto
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  // Llave del formulario
  GlobalKey<FormState>? _formKey;

  bool _invisiblePassword = true;

  // Variables donde se guardará la información del formulario
  String _user = "";
  String _email = "";
  String _password = "";
  String _confirmedPassword = "";

  @override
  Widget build(BuildContext context) {
    _formKey = widget.formKey;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Usuario",
              suffixIcon: IconButton(
                onPressed: () => _userController.clear(),
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
            obscureText: _invisiblePassword,
            onSaved: (newValue) => _password,
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
                  _invisiblePassword = !_invisiblePassword;
                }),
                icon: _invisiblePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey!.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Usuario creado"),
                  ),
                );
              }
            },
            child: const Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
