import 'package:first_demo/util/dialog_button.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create a task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogBotton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(width: 8.0),
                DialogBotton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
