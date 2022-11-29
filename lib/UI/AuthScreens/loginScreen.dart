import 'package:chat/constants/app_colors.dart';
import 'package:chat/constants/assets.dart';
import 'package:chat/widgets/form_card.dart';
import 'package:chat/widgets/social_icon/social_icon.dart';
import 'package:chat/widgets/social_icon/social_iconData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0.w,
        height: 16.0.h,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Container(
          width: 120.w,
          height: 1.0.h,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: AppColors.theme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0).r,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0).r,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          AppIcons.logo,
                          width:
                              //ScreenUtil().setWidth(110),
                              110.w,
                          height:
                              //ScreenUtil().setHeight(110),
                              110.h,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            const FormCard(),
                            SizedBox(
                              height: 35.h,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Row(
                            //       children: <Widget>[
                            //         SizedBox(
                            //           width: 12.0.w,
                            //         ),
                            //         GestureDetector(
                            //           onTap: _radio,
                            //           child: radioButton(_isSelected),
                            //         ),
                            //         SizedBox(
                            //           width: 8.0.w,
                            //         ),
                            //         Text('Remember me',
                            //             style: TextStyle(
                            //               fontSize: 12.sp,
                            //               fontFamily: 'Poppins-Medium',
                            //             )),
                            //       ],
                            //     ),
                            //     InkWell(
                            //       child: Container(
                            //           width: 300.w,
                            //           height: 100.h,
                            //           decoration: BoxDecoration(
                            //             gradient: const LinearGradient(colors: [
                            //               Color(0xFF17ead9),
                            //               Color(0xFF6078ea)
                            //             ]),
                            //             borderRadius: BorderRadius.circular(6.0),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 color: const Color(0xFF6078ea)
                            //                     .withOpacity(.3),
                            //                 offset: const Offset(0.0, 8.0),
                            //                 blurRadius: 8.0,
                            //               )
                            //             ],
                            //           ),
                            //           child: Material(
                            //               color: Colors.transparent,
                            //               child: InkWell(
                            //                   onTap: () {
                            //                     Navigator.pushReplacement(
                            //                         context,
                            //                         MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 const Home()));
                            //                   },
                            //                   child: Center(
                            //                       child: Text('SIGNIN',
                            //                           style: TextStyle(
                            //                               color: Colors.white,
                            //                               fontFamily:
                            //                                   'Poppins-Bold',
                            //                               fontSize: 18.sp,
                            //                               letterSpacing: 1.0)))))),
                            //     )
                            //   ],
                            // ),
                            SizedBox(
                              height: 40.h,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     horizontalLine(),
                            //     Text('Social Login',
                            //         style: TextStyle(
                            //           fontSize: 16.sp,
                            //           fontFamily: 'Poppins-Medium',
                            //         )),
                            //     horizontalLine(),
                            //   ],
                            // ),
                            SizedBox(
                              height: ScreenUtil().setHeight(40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SocialIcon(
                                  colors: const [
                                    Color(0xFF102397),
                                    Color(0xFF187adf),
                                    Color(0xFF00eaf8),
                                  ],
                                  icondata: CustomIcons.facebook,
                                  onPressed: () {},
                                ),
                                SocialIcon(
                                  colors: const [
                                    Color(0xFFff4f38),
                                    Color(0xFFff355d),
                                  ],
                                  icondata: CustomIcons.googlePlus,
                                  onPressed: () {},
                                ),
                                SocialIcon(
                                  colors: const [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea),
                                  ],
                                  icondata: CustomIcons.linkedin,
                                  onPressed: () {},
                                ),
                                SocialIcon(
                                  colors: const [
                                    Color(0xFF00c6fb),
                                    Color(0xFF005bea),
                                  ],
                                  icondata: CustomIcons.twitter,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'New User? ',
                                  style:
                                      TextStyle(fontFamily: 'Poppins-Medium'),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text('SignUp',
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Bold',
                                        color: Color(0xFF5d74e3),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<LoginController>(
  //     init: LoginController(),
  //     builder: ((controller) => SafeArea(
  //           child: Scaffold(
  //             body: SingleChildScrollView(
  //               child: Container(
  //                 padding:
  //                     const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
  //                 width: double.infinity,
  //                 child: Form(
  //                   key: _formkey,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       const Text(
  //                         "We Chat",
  //                         style: TextStyle(color: Colors.black),
  //                       ),
  //                       const SizedBox(
  //                         height: 50,
  //                       ),
  //                       CustomTextField(
  //                         title: "Phone Number",
  //                         hint: "Enter your phone number",
  //                         textEditingController: controller.phoneNumber,
  //                         inputType: TextInputType.phone,
  //                         //underLineField: true,
  //                         // validationRegax: RegExp(r'(^03[0-9]{9}$)'),
  //                         //suffixIconPath: "",
  //                         //onChange: (value) {},
  //                         validate: (value) =>
  //                             Validators.validatePhoneNumber(value),
  //                       ),
  //                       // CustomTextField(
  //                       //   title: "Password",
  //                       //   hint: "Password",
  //                       //   textEditingController: _username,
  //                       //   onChange: (value) {},
  //                       //   // validate: (value) =>
  //                       //   //     value!.isEmpty ? "Please enter UserName" : null,
  //                       // ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       // RefreshIndicator(
  //                       //     child: ElevatedButton(
  //                       //         onPressed: () {
  //                       //           // if (_formkey.currentState!.validate()) {}
  //                       //         },
  //                       //         child: const Icon(Icons.login)),
  //                       //     onRefresh: () async {}),
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           if (_formkey.currentState!.validate()) {
  //                             controller.sendOtp();
  //                           }
  //                         },
  //                         child: const Text(
  //                           "Send OTP",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                         // const Icon(Icons.login),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )),
  //   );
  
