import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final bool obscureTest;
  final TextInputType? keyboardType;
  final String labelTest;
  final String hintTest;
  final IconData icon;
  const CustomInput({
    super.key,
    this.validator,
    required this.obscureTest,
    this.keyboardType,
    required this.labelTest,
    required this.hintTest,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureTest,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelTest,
        hintText: hintTest,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        // filled: true,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
