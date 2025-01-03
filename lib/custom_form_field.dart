import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final String? Function(String?) validator;
  final TextEditingController textController;

  CustomFormField(
      {super.key,
      required this.hintText,
      this.isObscure = false,
      required this.validator,
      TextEditingController? textController})
      : textController = textController ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
          ),
        ),
        obscureText: isObscure,
        validator: validator,
        controller: textController,
      ),
    );
  }
}
