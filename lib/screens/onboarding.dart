import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'signin_screen.dart';
import 'signup_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/login_image.svg'),
            const SizedBox(height: 50.0),
            RichText(
              text: const TextSpan(
                text: '!We welcome you to',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Tasky',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.blue)),
                  TextSpan(text: '!'),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Manage all your projects and tasks \n in one place',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SignInScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: const Color.fromARGB(255, 31, 44, 226),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
