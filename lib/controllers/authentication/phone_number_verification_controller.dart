import 'dart:developer';

import 'package:chat/UI/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_autofill/otp_autofill.dart';

class PhoneNumberVerificationController extends GetxController {
  PhoneNumberVerificationController({required this.phoneNumber});
  String phoneNumber;
  //late OTPTextEditController pinCode;
  late TextEditingController pinCode;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verifyID;
  String verificationCode = '';
  late OTPTextEditController controller;
  late OTPInteractor _otpInteractor;

  @override
  void onInit() {
    pinCode = TextEditingController();
    getPinCode();
    //_otpInteractor = OTPInteractor();
    //_otpInteractor
    //   .getAppSignature()
    //ignore: avoid_print
    //  .then((value) => print('signature: $value'));
    //pinCodecontroller();

    super.onInit();
  }

  pinCodecontroller() {
    pinCode = OTPTextEditController(
      codeLength: 6,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
        (code) {
          try {
            final exp = RegExp(r'(\d{6})');
            return exp.stringMatch(code ?? '') ?? '';
          } catch (e) {
            print("error $e");
            return "";
          }
        },
        // strategies: [
        //   SampleStrategy(),
        // ],
      );
  }

  Future getPinCode() async {
    log("Starting OTP process");
    _auth.verifyPhoneNumber(
      phoneNumber:
          //"+923044574730",
          "+92${phoneNumber.toString()}",
      timeout: const Duration(seconds: 0),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  _verificationCompleted(PhoneAuthCredential authCredential) {
    log("verificationCompleted ");
    _auth.signInWithCredential(authCredential).then((UserCredential result) {
      Get.to(() => const Home());
    }).catchError((e) {
      log(e);
    });
  }

  _verificationFailed(FirebaseAuthException authException) {
    print(authException.message);
  }

  _codeSent(String verificationId, int? resendToken) async {
    log("codeSent $verificationId");
    //pinCodecontroller();
    verificationCode =
        verificationId; // Update the UI - wait for the user to enter the SMS code
    //String smsCode = 'xxxx';

    // Create a PhoneAuthCredential with the code
    //PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    //await _auth.signInWithCredential(credential);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    verificationCode = verificationId;

    log("Timout");
  }
}

class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'Your code is 54321',
    );
  }
}
// try {
//       await _auth.verifyPhoneNumber(
//           phoneNumber: phoneNumber, //'${globals.countryCode}$phoneNumber',
//           forceResendingToken: _forceResendingToken,
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             UserCredential result =
//                 await _auth.signInWithCredential(credential);
//             User? user = result.user;

//             if (user != null) {
//               loginSignupWithNumberAPi(context, islogin!, phoneNumber,
//                   name: name);

//               // Navigator.pushAndRemoveUntil(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (context) => CustomBottomNavigationBar()),
//               //     (route) => false);
//             } else {}
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             if (e.code == 'invalid-phone-number') {
//               customSnackBar('Invalid Phone Number', context);
//             } else if (e.code == "too-many-requests") {
//               customSnackBar(
//                   'Too many attempts. Please try again later!', context);
//             } else if (e.code == "session-expired") {
//               customSnackBar(
//                   "The sms code has expired. Please try again.", context);
//             } else {
//               customSnackBar(MyStrings.somethingWrong, context);
//             }
//           },
//           codeSent: (String verificationID, [int? forceResendingToken]) {
//             verificationCode = verificationID;
//             _forceResendingToken = forceResendingToken;
//           },
//           codeAutoRetrievalTimeout: (String verificationID) {
//             verificationCode = verificationID;
//           },
//           timeout: Duration(seconds: 60));
//     } catch (e) {
//       customSnackBar('$e', context);
//     }
