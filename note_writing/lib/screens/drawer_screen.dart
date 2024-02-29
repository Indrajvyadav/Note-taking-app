import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:note_writing/constants/note_model.dart';

import 'package:note_writing/main.dart';
import 'package:note_writing/screens/first_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Notes> notes = List.empty(growable: true);

  List<String> settings = ['Profile  ', 'My notes', 'Recycle bin', 'Settings'];

  //Lists

  // state constants
  Color col = primaryBColor;
  Color tex = primaryTColor;
  String dark = 'Dark Theme';
  String light = 'Light theme';
  Icon ico1 = const Icon(
    Icons.dark_mode_outlined,
    color: Colors.black,
  );
  Icon ico2 = const Icon(
    Icons.light_mode_outlined,
    color: Color.fromARGB(255, 242, 174, 73),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: col,
      appBar: AppBar(
        backgroundColor: tex,
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text('Add Note'),
        ),
      ),
      drawer: Drawer(
        shadowColor: tex,
        width: 200,
        backgroundColor: col.withOpacity(0.6),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.1192,
                width: 200,
                decoration: BoxDecoration(color: tex),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: ListView.builder(
                  itemCount: settings.length,
                  //  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: settingsBuilder(index),
                  ),
                ),
              ),
              Positioned(
                top: 750,
                left: 30,
                child: darkToLight(),
              ),
              Positioned(
                top: 800,
                left: 32,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: splColor,
                        padding: const EdgeInsets.symmetric(horizontal: 44)),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: col),
                    )),
              ),
              Positioned(
                top: 740,
                child: Container(
                  height: 1,
                  width: 200,
                  decoration: BoxDecoration(color: tex),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secBColor,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/jpeg/ind.jpg'))),
                ),
              ),
              Positioned(
                top: 50,
                left: 80,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Hi Indraj\n',
                    style: TextStyle(
                        fontSize: 18,
                        color: secBColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: 'Welcome back!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secBColor))
                ])),
                // ignore: avoid_unnecessary_containers
              ),
            ],
          ),
        ),
      ),
      body: const FirstScreen(),
    );
  }

  Padding settingsBuilder(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Card(
            shadowColor: splColor,
            color: tex,
            child: Center(
              child: Text(
                settings[index],
                style: TextStyle(
                    color: splColor, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton darkToLight() {
    // col = secBColor;
    // tex = secTColor;
    // dark = light;
    // ico1 = ico2;
    return TextButton.icon(
      onPressed: () {
        setState(() {
          if (col == primaryBColor && tex == primaryTColor) {
            col = secBColor;
            tex = secTColor;
            dark = light;
            ico1 = ico2;
          } else {
            col = primaryBColor;
            tex = primaryTColor;
            dark = 'Dark Theme';
            ico1 = const Icon(Icons.dark_mode_outlined, color: Colors.black);
          }
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: splColor,
      ),
      icon: ico1,
      label: Text(
        dark,
        style: TextStyle(fontSize: 14, color: col, fontWeight: FontWeight.bold),
      ),
    );
  }
}
