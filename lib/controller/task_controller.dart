
import 'package:first_demo/task_model/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  void addTask(Task task) {
    taskList.add(task);
  }

  void updateTask(int index, Task updatedTask) {
    taskList[index] = updatedTask;
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }
}
