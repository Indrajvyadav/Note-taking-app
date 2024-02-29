import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:note_writing/screens/note_screen.dart';
import 'package:note_writing/screens/note_view.dart';

import '../constants/note_model.dart';

//complete import
//relative import

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Notes> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Stack(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => textBuilder(index),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteScreen(addNote: addNote),
                    ));
              },
              backgroundColor: splColor,
              child: const Icon(
                Icons.add,
                size: 32,
                color: Color.fromRGBO(255, 255, 240, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding textBuilder(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteView(
                    note: Notes(
                        title: notes[index].title, body: notes[index].body),
                    index: index,
                    deleteNote: deleteNote),
              ));
        },
        child: SingleChildScrollView(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  splColor,
                  splColor.withOpacity(0.4),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    notes[index].title,
                    style: TextStyle(
                        color: primaryBColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    notes[index].body,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: primaryBColor,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNote(Notes note) {
    notes.add(note);
    setState(() {});
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
