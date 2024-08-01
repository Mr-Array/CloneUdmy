import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () {
                context.read<AuthProvider>().login(
                      emailController.text,
                      passwordController.text,
                    );
                Navigator.pushNamed(context, '/courses');
              },
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
