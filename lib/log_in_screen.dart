import 'package:flutter/material.dart';
import 'package:flutter_semi_final/auth_container.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:flutter_semi_final/home_screen.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = "LogIn";
  static const routeURL = "/LogIn";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.pushNamed(HomeScreen.routeName);
      }
    }
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
            vertical: 30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome!",
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
                  onTap: _onSubmitTap,
                  child: const ChangeColorButton(
                    disabled: false,
                    buttonName: 'Enter',
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
