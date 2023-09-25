import 'package:flutter/material.dart';
import 'package:flutter_semi_final/Log_in_screen.dart';
import 'package:flutter_semi_final/auth_container.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:flutter_semi_final/home_screen.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "SignUp";
  static const routeURL = "/SignUp";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onCreateTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.pushNamed(HomeScreen.routeName);
      }
    }
  }

  void _onLogInTap() {
    context.pushNamed(LogInScreen.routeName);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("🔥MOOD🔥"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 40,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Join!",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthContainer(
                  authHint: 'Email',
                  saveValue: (newValue) {
                    if (newValue != null) {
                      formData['email'] = newValue;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthContainer(
                  authHint: 'Password',
                  saveValue: (newValue) {
                    if (newValue != null) {
                      formData['password'] = newValue;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: _onCreateTap,
                  child: const ChangeColorButton(
                    disabled: false,
                    buttonName: 'Create Account',
                    buttonSize: 1,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _onLogInTap,
                  child: const ChangeColorButton(
                    disabled: false,
                    buttonName: 'Log in',
                    buttonSize: 1,
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
