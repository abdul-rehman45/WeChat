import 'package:chat/controllers/authentication/login_controller.dart';
import 'package:chat/helper/validators.dart';
import 'package:chat/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: ((controller) => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                          title: "Phone Number",
                          hint: "Enter your phone number",
                          textEditingController: controller.phoneNumber,
                          inputType: TextInputType.phone,
                          //underLineField: true,
                          // validationRegax: RegExp(r'(^03[0-9]{9}$)'),
                          //suffixIconPath: "",
                          //onChange: (value) {},
                          validate: (value) =>
                              Validators.validatePhoneNumber(value),
                        ),
                        // CustomTextField(
                        //   title: "Password",
                        //   hint: "Password",
                        //   textEditingController: _username,
                        //   onChange: (value) {},
                        //   // validate: (value) =>
                        //   //     value!.isEmpty ? "Please enter UserName" : null,
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        // RefreshIndicator(
                        //     child: ElevatedButton(
                        //         onPressed: () {
                        //           // if (_formkey.currentState!.validate()) {}
                        //         },
                        //         child: const Icon(Icons.login)),
                        //     onRefresh: () async {}),
                        ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {}
                            },
                            child: const Icon(Icons.login)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
