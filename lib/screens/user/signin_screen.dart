import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/screens/user/signup_screen.dart';

import '../home/homescreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;

  void checkLogin() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the details'),
        ),
      );
    }
  }

  // @override
  // void initState() {
  //   obscureText = true;
  //   super.initState();
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Password must contain at least one uppercase letter.';
                  }
                  return null;
                },
                controller: _passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          obscureText = !obscureText;
                        },
                      );
                    },
                    child: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: checkLogin,
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
