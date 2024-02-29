import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:note_writing/constants/note_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, required this.addNote});
  final Function(Notes) addNote;
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
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
        actions: [darkToLight()],
        backgroundColor: tex,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            'New note:',
            style: TextStyle(color: col),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          widget.addNote(
              Notes(title: titleController.text, body: bodyController.text));
          Navigator.pop(context);
        },
        backgroundColor: splColor,
        child: Icon(
          Icons.save_outlined,
          color: tex,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            textTitle(),
            textBody(),
          ],
        ),
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

              ico1 = ico2;
            } else {
              col = primaryBColor;
              tex = primaryTColor;

              ico1 = const Icon(Icons.dark_mode_outlined, color: Colors.black);
            }
          });
        },
        style: TextButton.styleFrom(backgroundColor: tex),
        icon: ico1,
        label: const Text(
          '',
          style: TextStyle(fontSize: 0.1),
        ));
  }

  Widget textTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: titleController,
        cursorColor: tex,
        style: TextStyle(
          fontSize: 25,
          color: tex,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title :',
          hintStyle: TextStyle(color: tex.withOpacity(0.8)),
        ),
      ),
    );
  }

  Widget textBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: TextFormField(
        controller: bodyController,
        scrollController: _scrollController,
        maxLines: 50,
        cursorColor: tex,
        style: TextStyle(
          fontSize: 18,
          color: tex,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Body :',
          hintStyle: TextStyle(color: tex.withOpacity(0.8)),
          //contentPadding: EdgeInsets.symmetric(vertical: 50),
        ),
      ),
    );
  }
}
