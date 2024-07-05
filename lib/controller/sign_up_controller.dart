import 'package:first_demo/util/valid_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_demo/task_app/todo_home.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final phoneNumber = ''.obs;
  final agreePersonalData = false.obs;
  final toggled = true.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  void signUp() {
    if (formKey.currentState!.validate() && agreePersonalData.value) {
      Get.to(() => TodoHome(name: fullName.value ));
    } else if (!agreePersonalData.value) {
      Get.snackbar(
        'Error',
        'Please agree to the processing of personal data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  bool isEmail(String value) {
    return ValidEmail().validate(value);
  }
  
}
