
import 'package:first_demo/task_model/task_model.dart';
import 'package:flutter/material.dart';


class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  async {
        return false;
        },
      child: Scaffold(
        appBar: AppBar(
          title: Text(task.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description: ${task.description}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Date Created: ${task.dateCreated.toString()}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Status: ${task.isCompleted ? "Completed" : "Pending"}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
