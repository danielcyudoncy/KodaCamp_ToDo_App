import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;

  const DialogWidget({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.taskNameController,
    required this.taskDescriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Your Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: taskNameController,
            decoration: InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: taskDescriptionController,
            decoration: InputDecoration(
              labelText: 'Task Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSave,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
