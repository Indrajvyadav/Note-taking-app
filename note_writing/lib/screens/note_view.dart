import 'package:flutter/material.dart';
import 'package:note_writing/constants/constants.dart';
import 'package:note_writing/constants/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {super.key,
      required this.note,
      required this.index,
      required this.deleteNote});
  final Notes note;
  final int index;
  final Function(int index) deleteNote;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secTColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text('Note View'),
        ),
      ),
      backgroundColor: secBColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secTColor,
        onPressed: () {
          deleteNote(index);
          Navigator.pop(context);
        },
        child: Icon(
          Icons.delete_forever_outlined,
          color: secBColor,
          size: 32,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                    color: primaryBColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.body,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: primaryBColor,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
