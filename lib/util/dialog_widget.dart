import 'package:first_demo/util/dialog_button.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
        height: 120,
        child: const Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create a task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogBotton(),
                SizedBox(width: 8.0),
                DialogBotton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
