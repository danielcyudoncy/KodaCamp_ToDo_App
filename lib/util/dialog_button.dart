import 'package:flutter/material.dart';

class DialogBotton extends StatelessWidget {
  const DialogBotton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColorDark,
      child: Text(text),
    );
  }
}
