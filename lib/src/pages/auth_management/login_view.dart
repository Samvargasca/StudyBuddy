import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:study_buddy/src/services/firebase_service.dart";

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Email/User"),
              controller: _emailController,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              controller: _passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      try {
                        firebaseService.signInWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                          duration: const Duration(milliseconds: 300),
                        ));
                      }
                      print(_passwordController.text);
                    },
                    child: const Text("Log In")),
                ElevatedButton(
                    onPressed: () {
                      try {
                        firebaseService.createUserWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                            duration: const Duration(milliseconds: 300),
                          ));
                        }
                      }
                      print(_passwordController.text);
                    },
                    child: const Text("Sign Up"))
              ],
            ),
            Text(firebaseService.user.toString()),
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
                  print(_passwordController.text);
                },
                child: const Text("Log Out"))
          ],
        ),
      )),
    );
  }
}
