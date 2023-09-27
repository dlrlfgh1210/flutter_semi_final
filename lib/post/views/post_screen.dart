import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/change_color_button.dart';
import 'package:flutter_semi_final/post/view_models/upload_post_view_model.dart';
import 'package:flutter_semi_final/post/views/mood_container.dart';

class PostScreen extends ConsumerStatefulWidget {
  static const routeName = "post";
  static const routeURL = "/post";
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  int selectedMoodIndex = -1;
  late TextEditingController _postEditingController;

  @override
  void initState() {
    super.initState();
    _postEditingController = TextEditingController();
  }

  void onMoodSelected(int index) {
    setState(() {
      selectedMoodIndex = index;
    });
  }

  void _onScaffoldTap() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> _onPostTap() async {
    String selectedMood =
        selectedMoodIndex >= 0 ? moods[selectedMoodIndex] : "";
    ref.read(uploadPostProvider.notifier).uploadMood(
          _postEditingController.text,
          selectedMood,
          context,
        );
    _postEditingController.clear();
    selectedMoodIndex = -1;
  }

  @override
  void dispose() {
    _postEditingController.dispose();
    super.dispose();
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
                    textInputAction: TextInputAction.done,
                    autofocus: false,
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
                Center(
                  child: GestureDetector(
                    onTap: _onPostTap,
                    child: ChangeColorButton(
                      disabled: ref.watch(uploadPostProvider).isLoading,
                      buttonName: "Post",
                      buttonSize: 0.6,
                    ),
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
