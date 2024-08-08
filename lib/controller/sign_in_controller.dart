import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_demo/task_app/todo_home.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var agreePersonalData = false.obs;
  var toggled = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      Get.to(() => TodoHome(
            // data: '',
            name: fullNameController.text,
          ));
    }
  }
}
