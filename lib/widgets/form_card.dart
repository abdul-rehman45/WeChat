import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0,
            ),
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Login',
                  style: TextStyle(
                    fontSize: 45.sp,
                    fontFamily: 'Poppins-Bold',
                    letterSpacing: .6,
                  )),
              SizedBox(
                height: 30.h,
              ),
              Text('Username',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 26.sp,
                  )),
              TextField(
                decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text('Password',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 26.sp,
                  )),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp)),
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Poppins-Medium',
                        fontSize: 28.sp,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
