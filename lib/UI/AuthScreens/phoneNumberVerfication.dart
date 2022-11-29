import 'package:flutter/material.dart';
import 'package:chat/controllers/authentication/phone_number_verification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PhoneNumberVerfication extends StatefulWidget {
  const PhoneNumberVerfication({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;

  @override
  State<PhoneNumberVerfication> createState() => _PhoneNumberVerficationState();
}

class _PhoneNumberVerficationState extends State<PhoneNumberVerfication> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneNumberVerificationController>(
      init: PhoneNumberVerificationController(phoneNumber: widget.phoneNumber),
      builder: ((controller) => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20)
                          .r,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "We Chat",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Get.width * 0.025).r,
                            child:
                                // TextField(
                                //   textAlign: TextAlign.center,
                                //   keyboardType: TextInputType.number,
                                //   controller: controller.pinCode,
                                // ),
                                Pinput(
                              length: 6,
                              //defaultPinTheme: _defaultPinTheme,
                              //focusedPinTheme: _focusedPinTheme,
                              keyboardType: TextInputType.number,
                              controller: controller.pinCode,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              //verifyOtp();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8).r,
                              height: 45.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 253, 188, 51),
                                borderRadius: BorderRadius.circular(36),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
