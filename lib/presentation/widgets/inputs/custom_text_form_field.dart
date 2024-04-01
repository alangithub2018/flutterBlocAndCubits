import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final InputDecoration decoration;
  final bool obscureText;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key, 
    required this.decoration, 
    this.obscureText = false, 
    this.errorMessage, 
    this.onChanged,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: decoration.hintText,
            labelText: decoration.labelText,
            prefixIcon: decoration.prefixIcon,
            errorText: errorMessage,
        )
      );
  }
}
