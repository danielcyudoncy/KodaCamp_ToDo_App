import 'package:first_demo/form_app/valid_email.dart';
import 'package:first_demo/pages/signup_screen.dart';
import 'package:first_demo/task_app/todo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool toggled = false;
  bool agreePersonalData = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Enter your Email',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                                          ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    validateEmail(value!);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: toggled,
                  obscuringCharacter: '*',
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: toggled
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            ),
                      onPressed: () {
                        setState(() {
                          toggled = !toggled;
                        });
                      },
                    ),
                    label: const Text('Password'),
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 38, 59, 252))),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TodoHome(data: 'welcome'),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      child: Text(
                        'Sign in with',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
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
                const SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset('assets/images/icon-google.svg'),
                        const Text(
                          'Google',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (e) => const SignUpScreen(),
                          ),
                        );
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
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}