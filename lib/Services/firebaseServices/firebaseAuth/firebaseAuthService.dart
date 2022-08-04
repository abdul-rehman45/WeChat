import 'dart:convert';

import 'package:chat/Services/firebaseServices/firebaseAuth/AuthService.dart';
import 'package:chat/model/facebookModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthFireBase {
  final authService = AuthService();
  late final FacebookAuth _facebookAuth;
  //final FacebookLogin  facebookLogin = FacebookLogin();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? user;
  bool _loggedIn = false;

  final int _counter = 0;
  Stream<User?> get currentUser => authService.currentUser;

  Future<dynamic> loginFacebook(BuildContext context) async {
    bool? _isLogged;
    Map<String, dynamic>? _userData;
    //Map<String, dynamic>? get userData => _userData;
    final LoginResult result = await _facebookAuth.login(
        loginBehavior: LoginBehavior.dialogOnly,
        permissions: ['email', 'public_profile']);

    _isLogged = result.status == LoginStatus.success;
    if (_isLogged) {
      _userData = await _facebookAuth.getUserData();
      (_userData);
    }
    if (_userData != null) {
      FacebookAuth.instance.logOut();
      FacebookLoginModel facebookLoginModel =
          FacebookLoginModel.fromJson(_userData);
      return facebookLoginModel;
    } else {
      FacebookAuth.instance.logOut();
      // FlutterToastCall.instance.toast(
      //   "${StringConstant.wrong}",
      //);

      return null;
    }

    //User user = await FirebaseAuth.instance.currentUser;

    // print('Starting Facebook Login');
    // try {
    //   FacebookLoginResult _result =
    //       await facebookLogin.logIn(['email', 'public_profile']);
    //   bool isFBLogin = false;
    //   switch (_result.status) {
    //     case FacebookLoginStatus.cancelledByUser:
    //       print("FacebookLogin cancelledByUser");

    //       break;
    //     case FacebookLoginStatus.error:
    //       print("FacebookLogin error");

    //       break;
    //     case FacebookLoginStatus.loggedIn:
    //       print("User fb loged..");
    //       isFBLogin = await signinWithFacebook(_result, context);
    //       return isFBLogin;
    //       break;
    //     // default:
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  // Future<bool> signinWithFacebook(
  //     FacebookLoginResult _result, BuildContext context) async {
  //   try {
  //     FacebookAccessToken _accessToken = _result.accessToken;
  //     print("_result.accessToken");
  //     print(_result.accessToken);
  //     AuthCredential _credential =
  //         FacebookAuthProvider.credential(_accessToken.token);
  //     print("_credential.providerId");
  //     print(_credential.providerId);
  //     var authResult = await _auth.signInWithCredential(_credential);
  //     final User? user = authResult.user;

  //     if (user != null) {
  //       assert(!user.isAnonymous);
  //       assert(await user.getIdToken() != null);

  //       assert(user.email != null);
  //       assert(user.displayName != null);
  //       assert(user.photoURL != null);

  //       print('${user.displayName} is now logged in');
  //       // globals.fullname = user.displayName;
  //       // globals.email = user.email;
  //       // globals.phonenumber = user.phoneNumber;
  //       // globals.image = user.photoURL;
  //       // globals.userlogintype = "facebook";
  //       // globals.firsttime = false;

  //       print('signinWithFacebook succeeded: $user');

  //       return true;
  //     }

  //     return false;
  //   } catch (e) {
  //     print(e.toString());

  //     return false;
  //   }
  // }

  logout() {
    authService.logout();
  }

  Future<bool> signinApple(BuildContext context) async {
    bool islogin = false;
    final AuthorizationResult result = await TheAppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:

        // Store user ID
        await const FlutterSecureStorage()
            .write(key: "userId", value: result.credential?.user);
        print(result);
        print(result.credential?.email);
        // globals.appleuserdata = result.credential;
        // globals.email = result.credential.email;
        // globals.fullname = result.credential.fullName.toString();
        // globals.image = "";
        // globals.userlogintype = "apple";
        // globals.firsttime = false;
        return islogin = true;

        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error?.localizedDescription}");

        return islogin;
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        return islogin;
      // break;
    }
  }

  void checkLoggedInState() async {
    final userId = await const FlutterSecureStorage().read(key: "userId");
    if (userId == null) {
      print("No stored user ID");
      return;
    }

    final credentialState = await TheAppleSignIn.getCredentialState(userId);
    switch (credentialState.status) {
      case CredentialStatus.authorized:
        print("getCredentialState returned authorized");
        break;

      case CredentialStatus.error:
        print(
            "getCredentialState returned an error: ${credentialState.error?.localizedDescription}");
        break;

      case CredentialStatus.revoked:
        print("getCredentialState returned revoked");
        break;

      case CredentialStatus.notFound:
        print("getCredentialState returned not found");
        break;

      case CredentialStatus.transferred:
        print("getCredentialState returned not transferred");
        break;
    }
  }

  Future<User?> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;

      print("user id: ${user!.uid}");
      print("user name: ${user!.displayName}");
      print("user email: ${user!.email}");
      print("USer LOggedIN! ");

      _loggedIn = true;

      return user!;
    } on Exception catch (exception) {
      // only executed if error is of type Exception
      print("$exception");
    } catch (error) {
      // executed for errors of all types other than Exception
      print("$error");
    }
    return null;
  }

  signOut() async {
    await _googleSignIn.signOut();
    _loggedIn = false;
    print("Logout!");
  }

  Future<User?> registerWithEmail(String email, String password) async {
    User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (user != null) {
      // setState(() {
      //   _success = true;
      //   _userEmail = user.email;
      // });
      return user;
    } else {
      return null;
      // setState(() {
      //   _success = true;
      // });
    }
  }
}
