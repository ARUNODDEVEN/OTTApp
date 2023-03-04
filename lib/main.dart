import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/widgets/loginscreen.dart';
import 'package:ott/widgets/trending.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            initialRoute: 'login',
            // initialRoute: '/',
            routes: {
              'home': (context) => Home(),
              'login': (context) => Istscreen(),
            },
            home: Home(),
            debugShowCheckedModeBanner: false,
            title: "OverTHETOP",
            theme: ThemeData(brightness: Brightness.dark),
          );
        });
  }
}
