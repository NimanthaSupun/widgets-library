import 'package:flutter/material.dart';
import 'package:recap/pages/main_screen.dart';
import 'package:recap/service/auth/auth_service.dart';
import 'package:recap/widget/custom_button.dart';
import 'package:recap/widget/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _userSign(BuildContext context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      setState(() {
        _isLoading = true;
      });

      await AuthService().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await Future.delayed(Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).push(MaterialPageRoute(builder: (context) => MainScreen()));
    } catch (err) {
      // If sign-in fails, show error dialog
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Error"),
              content: Text("Sign in failed: $err"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok"),
                ),
              ],
            ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: _emailController,
                    obscureTest: false,
                    labelTest: "Email",
                    hintTest: "Email",
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter email";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: _passwordController,
                    obscureTest: true,
                    labelTest: "password",
                    hintTest: "Password",
                    icon: Icons.password_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter passwors";
                      }
                      if (value.length < 6) {
                        return "password must be 6 characters long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                        width: double.infinity,
                        title: "SingIn",
                        onpresed: () => _userSign(context),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
