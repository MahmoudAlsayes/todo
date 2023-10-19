import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class LoginTab extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Please enter valid email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FirebaseFunction.login(
                      emailController.text, passwordController.text, (user) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeLayout.routeName, (route) => false,
                    arguments: user);

                  }, (errorMessage) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(errorMessage),
                        actions: [
                          ElevatedButton(onPressed: () {}, child: Text("Okey"))
                        ],
                      ),
                    );
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
