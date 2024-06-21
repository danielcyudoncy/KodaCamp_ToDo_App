import 'package:first_demo/util/dialog_widget.dart';
import 'package:first_demo/util/task_widget.dart';
import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key, required this.data, required this.name});
  final String name;
  final String data;

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final controller = TextEditingController();
  List taskList = [
    // ['Task 1', false],
    // ['Task 2', true],
  ];
  int _selectedIndex = 0;

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
      },
    );
  }

  void editTask(BuildContext context, int index) {
    final TextEditingController taskController =
        TextEditingController(text: taskList[index][0]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(labelText: 'Task Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final editedTaskName = taskController.text;
                setState(() {
                  taskList[index][0] = editedTaskName;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int getTotalTasks() {
    return taskList.length;
  }

  int getCompletedTasks() {
    return taskList.where((task) => task[1] == true).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 216, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 216, 216),
        title: Text(
          'ToDo,  ${widget.name}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      title: const Text('Total Number of  Tasks'),
                      trailing: Text(
                        getTotalTasks().toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Space between the cards
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      title: const Text('Completed Tasks'),
                      trailing: Text(
                        getCompletedTasks().toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  taskName: taskList[index][0],
                  taskCompleted: taskList[index][1],
                  onChanged: (value) => taskCompleted(value, index),
                  onDelete: (value) => deleteTask(index),
                  onEdit: (value) => editTask(context, index),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.preview_rounded),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
