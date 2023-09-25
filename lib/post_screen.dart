import 'package:flutter/material.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:flutter_semi_final/mood_container.dart';

class PostScreen extends StatefulWidget {
  static const routeName = "Post";
  static const routeURL = "/Post";
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String _post = "";
  final TextEditingController _postEditingController = TextEditingController();
  int selectedMoodIndex = -1;
  void onMoodSelected(int index) {
    setState(() {
      selectedMoodIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _postEditingController.addListener(() {
      setState(() {
        _post = _postEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _postEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("🔥MOOD🔥"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
        ),
        child: SingleChildScrollView(
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 5,
                        offset: Offset(0, 5))
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  controller: _postEditingController,
                  decoration: const InputDecoration(
                      hintText: "Write it down here!",
                      border: InputBorder.none),
                ),
              ),
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
    );
  }
}
