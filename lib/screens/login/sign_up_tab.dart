import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class SignUpTab extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emaiilController = TextEditingController();
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
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emaiilController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
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
                  FirebaseFunction.creatUser(
                    nameController.text,int.parse(ageController.text),
                      emaiilController.text, passwordController.text, () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  }, (errorMessage) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(

                        title: Text("Error"),
                        content: Text(errorMessage),
                        actions: [
                          ElevatedButton(onPressed: () {}, child: Text("Okay"))
                        ],
                      ),
                    );
                  });
                }
              },
              child: const Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
