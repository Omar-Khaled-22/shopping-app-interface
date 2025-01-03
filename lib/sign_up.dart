import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/custom_form_field.dart';
import 'package:new_project/homePage.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  void isValid() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomFormField(
              hintText: "Full name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your full name";
                }
                if (value[0] != value[0].toUpperCase()) {
                  return 'The first letter must be capitalized';
                }
              },
            ),
            CustomFormField(
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Email";
                }
                if (!value.contains("@") || !value.contains('.')) {
                  return 'The email must contains @ and .';
                }
              },
            ),
            CustomFormField(
              textController: _passwordController,
              hintText: "Password",
              isObscure: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Password";
                }
                if (value.length < 6) {
                  return 'The Password must contains 6 characters';
                }
              },
            ),
            CustomFormField(
              hintText: "confirm the password",
              isObscure: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                if (value != _passwordController.text) {
                  return 'please confirm your password';
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                },
                child: Text("SignUp"))
          ],
        ),
      ),
    );
  }
}
