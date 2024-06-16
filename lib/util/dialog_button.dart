import 'package:flutter/material.dart';

class DialogBotton extends StatelessWidget {
  const DialogBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Theme.of(context).primaryColorDark,
      child: const Text('Submit'),
    );
  }
}
