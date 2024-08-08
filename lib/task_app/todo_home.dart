import 'package:first_demo/controller/task_controller.dart';
import 'package:first_demo/screens/task_detail_screen.dart';
import 'package:first_demo/task_model/task_model.dart';
import 'package:first_demo/util/dialog_widget.dart';
import 'package:first_demo/util/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoHome extends StatefulWidget {
  final String name;

  const TodoHome({super.key, required this.name});

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final TaskController taskController = Get.put(TaskController());
  late TextEditingController taskNameController;
  late TextEditingController taskDescriptionController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          onSave: () {
            final newTask = Task(
              title: taskNameController.text,
              description: taskDescriptionController.text,
              dateCreated: DateTime.now(),
            );
            taskController.addTask(newTask);
            taskNameController.clear();
            taskDescriptionController.clear();
            Navigator.pop(context);
          },
          onCancel: () {
            taskNameController.clear();
            taskDescriptionController.clear();
            Navigator.pop(context);
          },
          taskNameController: taskNameController,
          taskDescriptionController: taskDescriptionController,
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${widget.name}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(context),
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
                      title: const Text('Total Number of Tasks'),
                      trailing: Obx(
                        () => Text(
                          taskController.taskList.length.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      title: const Text('Completed Tasks'),
                      trailing: Obx(
                        () => Text(
                          taskController.taskList
                              .where((task) => task.isCompleted)
                              .length
                              .toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: taskController.taskList.length,
                itemBuilder: (context, index) {
                  final task = taskController.taskList[index];
                  return TaskWidget(
                    taskName: task.title,
                    taskCompleted: task.isCompleted,
                    onChanged: (value) {
                      if (value != null) {
                        taskController.updateTask(
                          index,
                          Task(
                            title: task.title,
                            description: task.description,
                            dateCreated: task.dateCreated,
                            isCompleted: value,
                          ),
                        );
                      }
                    },
                    onDelete: (context) => taskController.deleteTask(index),
                    onEdit: (context) {
                      taskNameController.text = task.title;
                      taskDescriptionController.text = task.description;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Edit Task'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: taskNameController,
                                  decoration: InputDecoration(labelText: 'Task Title',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
                                  onChanged: (text) {
                                    taskNameController.text = text;
                                  },
                                ),
                                const SizedBox(height: 12,),
                                TextField(
                                  controller: taskDescriptionController,
                                  decoration: InputDecoration(labelText: 'Task Description',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
                                  onChanged: (text) {
                                    taskDescriptionController.text = text;
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),),
                                onPressed: () {
                                  final editedTask = Task(
                                    title: taskNameController.text,
                                    description: taskDescriptionController.text,
                                    dateCreated: task.dateCreated,
                                    isCompleted: task.isCompleted,
                                  );
                                  taskController.updateTask(index, editedTask);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Save',),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onView: () {
                      Get.to(TaskDetailScreen(task: task));
                    },
                  );
                },
              ),
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
