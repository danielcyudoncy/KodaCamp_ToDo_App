import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/sign_up_controller.dart';
import 'signin_screen.dart'; 

class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => Form(
              key: signUpController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: signUpController.fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Full Name'),
                      hintText: 'Enter Full Name',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => signUpController.fullName.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: signUpController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => signUpController.validateEmail(value),
                    onChanged: (value) => signUpController.email.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: signUpController.passwordController,
                    obscureText: signUpController.toggled.value,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: signUpController.toggled.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          signUpController.toggled.toggle();
                        },
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => signUpController.password.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: signUpController.confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: signUpController.toggled.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          signUpController.toggled.toggle();
                        },
                      ),
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: signUpController.toggled.value,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value != signUpController.password.value) {
                        return "Passwords don't match";
                      }
                      return null;
                    },
                    onChanged: (value) => signUpController.confirmPassword.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: signUpController.phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 11) {
                        return 'Phone number should be exactly 11 digits';
                      }
                      return null;
                    },
                    onChanged: (value) => signUpController.phoneNumber.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: signUpController.agreePersonalData.value,
                        onChanged: (value) {
                          signUpController.agreePersonalData.value = value!;
                        },
                        activeColor: Colors.blue,
                      ),
                      const Text(
                        'I agree to the processing of ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const Text(
                        'Personal data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        signUpController.signUp();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                        backgroundColor: const Color.fromARGB(255, 31, 44, 226),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Sign up'),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Text(
                          'Sign up with',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/icon-google.svg',
                                                      ),
                          const SizedBox(width: 15.0),
                          const Text(
                            'Google',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignInScreen());
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
