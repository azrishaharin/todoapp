import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  SimpleButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
