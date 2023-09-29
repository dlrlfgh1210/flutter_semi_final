import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/authentication/view_models/log_in_view_model.dart';
import 'package:flutter_semi_final/authentication/views/auth_container.dart';
import 'package:flutter_semi_final/authentication/views/sign_up_screen.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends ConsumerStatefulWidget {
  static const routeName = "LogIn";
  static const routeURL = "/LogIn";
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(logInProvider.notifier).logIn(
              formData["email"]!,
              formData["password"]!,
              context,
            );
      }
    }
  }

  void _onSignUpTap() {
    context.pushNamed(SignUpScreen.routeName);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: ChangeColorButton(
                    disabled: ref.watch(logInProvider).isLoading,
                    buttonName: 'Enter',
                    buttonSize: 1,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _onSignUpTap,
                  child: const ChangeColorButton(
                    disabled: false,
                    buttonName: 'Create an account',
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
