import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  static const routeName = "Post";
  static const routeURL = "/Post";
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
