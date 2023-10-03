import 'package:flutter/material.dart';
import 'package:todo_app/util/button1.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[200],
      title: const Text("Add new note"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      actions: [
        SimpleButton(text: "Save", onPressed: onSave),
        SimpleButton(
            text: "Cancel",
            onPressed: (() {
              Navigator.pop(context);
            }))
      ],
    );
  }
}
