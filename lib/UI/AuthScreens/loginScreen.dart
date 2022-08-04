import 'package:chat/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          width: double.infinity,
          child: Form(
            key: _formkey,
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
                CustomTextField(
                  title: "UserName",
                  hint: "UserName or Email",
                  textEditingController: _username,
                  //suffixIconPath: "",
                  onChange: (value) {},
                  validate: (value) =>
                      value!.isEmpty ? "Please enter UserName" : null,
                ),
                CustomTextField(
                  title: "Password",
                  hint: "Password",
                  textEditingController: _username,
                  onChange: (value) {},
                  // validate: (value) =>
                  //     value!.isEmpty ? "Please enter UserName" : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                RefreshIndicator(
                    child: ElevatedButton(
                        onPressed: () {
                          // if (_formkey.currentState!.validate()) {}
                        },
                        child: const Icon(Icons.login)),
                    onRefresh: () async {}),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {}
                    },
                    child: const Icon(Icons.login)),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
