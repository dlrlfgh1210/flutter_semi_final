import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = "first";
  static const routeURL = "/first";
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "First Screen",
        ),
      ),
    );
  }
}
