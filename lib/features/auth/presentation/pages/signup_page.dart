import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            AuthField(hintText: 'Email'),
            SizedBox(height: 15),
            AuthField(hintText: 'Name'),
            SizedBox(height: 15),
            AuthField(hintText: 'Password'),
            SizedBox(height: 20),
            AuthGradientButton(buttonName: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
