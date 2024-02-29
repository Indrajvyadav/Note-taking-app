import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:note_writing/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: TextTheme(
          labelMedium:
              TextStyle(fontWeight: FontWeight.normal, color: secBColor),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const RegScreen(),
      ),
    );
  }
}
