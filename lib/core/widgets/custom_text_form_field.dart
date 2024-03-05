import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.obscureText = false,
      required this.controller,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: theme.textTheme.bodySmall,
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(maxWidth: 50),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xffACACAC),
            ),
          ),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
