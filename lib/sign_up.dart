import 'package:flutter/material.dart';
import 'package:new_project/custom_form_field.dart';
import 'package:new_project/homePage.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

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
                    showMyDialog(context);
                  }
                },
                child: Text("SignUp"))
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome'),
          content: Text("you are logged in"),
          actions: <Widget>[
            TextButton(
              child: const Text('close'),
              onPressed: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                  // PageRouteBuilder Creates a custom page route with custom animations
                  // pageBuilder will Defines the screen to navigate to (HomeScreen)
                  // and transitionsBuilder Defines the custom transition and the child is the home screen
                  PageRouteBuilder(
                    // Sets the duration of the fade-in animation
                    transitionDuration: const Duration(milliseconds: 500),
                    // Sets the duration of the reverse fade-out animation
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),

                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomeScreen(),

                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Fade transition for the screen transition
                      // it has opacity which will be invisble at first(0) then fully visible(1)
                      //tween i think it makes an in between frames to make the transition more smooth and we will aplly it using drive
                      //ease in and out makes the transition ends and starts slow and in the middle more fast
                      return FadeTransition(
                        opacity: animation.drive(
                          Tween(begin: 0.0, end: 1.0)
                              .chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
