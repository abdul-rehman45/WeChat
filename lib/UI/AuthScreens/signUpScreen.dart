import 'package:chat/Services/firebaseServices/firebaseAuth/firebaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  User? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "We Chat",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    label: Text("UserName"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      user = await AuthFireBase()
                          .registerWithEmail(_email.text, _password.text);
                      if (user != null) {
                        print(user!.uid.toString());
                      } else {}
                    },
                    child: const Icon(Icons.login)),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
