import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_writing/screens/drawer_screen.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.3,
          decoration: BoxDecoration(
            color: primaryTColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ),
        const Positioned(
          top: 300,
          left: 150,
          child: Text(
            'Login!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
        Positioned(
          top: 380,
          left: 20,
          child: SizedBox(
            width: 350,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  icon: const Icon(Icons.email_rounded, size: 35),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: secBColor),
                  hintText: 'abc@gmail.com'),
            ),
          ),
        ),
        Positioned(
          top: 480,
          left: 20,
          child: SizedBox(
            width: 350,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: const Icon(Icons.key_sharp, size: 35),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                labelText: 'Enter password',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: secBColor),
              ),
            ),
          ),
        ),
        Positioned(
          top: 570,
          left: 140,
          child: SizedBox(
            height: 50,
            width: 120,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DrawerScreen();
                  },
                ));
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryTColor,
                  foregroundColor: primaryBColor,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 650,
          left: 20,
          child: Text(
            'Or sign-up with :\n',
            style: TextStyle(fontSize: 24, color: secBColor),
          ),
        ),
        Positioned(
          top: 700,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 85),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: SvgPicture.asset('assets/images/svg/Google.svg'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
              ),
              SizedBox(
                height: 43,
                width: 43,
                child: Image.asset('assets/images/png/fb.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
              ),
              SizedBox(
                height: 43,
                width: 43,
                child: Image.asset('assets/images/png/linkedin.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
