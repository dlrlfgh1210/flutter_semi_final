import 'package:flutter/material.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:flutter_semi_final/mood_container.dart';
import 'package:flutter_semi_final/post_form.dart';

class PostScreen extends StatefulWidget {
  static const routeName = "post";
  static const routeURL = "/post";
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int selectedMoodIndex = -1;
  void onMoodSelected(int index) {
    setState(() {
      selectedMoodIndex = index;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("🔥MOOD🔥"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How do you feel?",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PostForm(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "What's your mood?",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MoodContainer(onMoodSelected: onMoodSelected),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: ChangeColorButton(
                    disabled: false,
                    buttonName: "Post",
                    buttonSize: 0.6,
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
