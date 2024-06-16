import 'package:first_demo/util/dialog_widget.dart';
import 'package:first_demo/util/task_widget.dart';
import 'package:flutter/material.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return const DialogWidget();
          });
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 65, 112),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 175, 132),
          title: const Text(
            'Task App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            createNewTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return TaskWidget(
              taskName: 'Task 1',
              taskCompleted: true,
              onChanged: (p0) {},
            );
          },
        ));
  }
}
