import 'package:first_demo/util/dialog_widget.dart';
import 'package:first_demo/util/task_widget.dart';
import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final controller = TextEditingController();
  List taskList = [
    // ['Task 1', false],
    // ['Task 2', true],
  ];
  void taskCompleted(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      taskList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.pop(context);
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            controller: controller,
            onSave: () {
              saveNewTask();
            },
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 175, 132),
        title: const Text(
          'ToDo',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            taskName: taskList[index][0],
            taskCompleted: taskList[index][1],
            onChanged: (value) => taskCompleted(value, index),
            onDelete: (value) => deleteTask(index),
          );
        },
      ),
    );
  }
}
