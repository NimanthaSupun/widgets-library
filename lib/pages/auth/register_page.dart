import 'package:flutter/material.dart';
import 'package:recap/widget/custom_button.dart';
import 'package:recap/widget/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        controller: _nameController,
                        obscureTest: false,
                        labelTest: "Name",
                        hintTest: "Name",
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _emailController,
                        obscureTest: false,
                        labelTest: "Email",
                        hintTest: "Email",
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your email";
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _paswordController,
                        obscureTest: true,
                        labelTest: "Password",
                        hintTest: "Password",
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your password";
                          }
                          if (value.length < 6) {
                            return "password must be at least 6 characters long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _confirmPasswordController,
                        obscureTest: true,
                        labelTest: "ConfirmPassword",
                        hintTest: "ConfirmPassword",
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Confirm your password";
                          }
                          if (value != _paswordController.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        width: double.infinity,
                        title: "Register",
                        onpresed: () => {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
