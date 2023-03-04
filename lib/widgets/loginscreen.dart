import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ott/auth/googleauth.dart';
import 'package:ott/home.dart';

class Istscreen extends StatefulWidget {
  Istscreen({
    super.key,
  });

  @override
  State<Istscreen> createState() => _IstscreenState();
}

class _IstscreenState extends State<Istscreen> {
  bool hover = false;

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(

          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Icon(
                Icons.catching_pokemon,
                color: Colors.red,
                size: 100,
              ),
            ),
            Wrap(
              children: [
                Text(
                  "over",
                  style: TextStyle(
                      letterSpacing: 6, color: Colors.white, fontSize: 20.sp),
                ),
                Text(
                  "THE",
                  style: TextStyle(
                      letterSpacing: 6, color: Colors.red, fontSize: 20.sp),
                ),
                Text(
                  "TOP",
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 6, fontSize: 20.sp),
                ),
              ],
            ),
            SizedBox(
              height: 200.h,
            ),
            TextButton(
                onPressed: () async {
                  bool res = await _authMethods.signInWithGoogle(context);
                  if (res) {
                    Navigator.pushNamed(context, 'home');
                  }
                },
                child: InkWell(
                  hoverColor: Colors.black,
                  onHover: (value) {
                    hover = !hover;
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Logo(
                          Logos.google,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Google Sign in",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    height: 50.h,
                    width: 350.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                  ),
                ))
          ]),
    ));
  }
}
