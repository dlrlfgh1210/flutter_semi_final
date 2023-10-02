import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/update_mood_container.dart';

class UpdatePostScreen extends ConsumerStatefulWidget {
  static const routeName = "edit";
  static const routeURL = "/edit";
  final TextEditingController moodController;
  final TextEditingController detailController;
  final String initialMood;
  final String initialDetail;
  final String postId; // postId 매개변수 추가

  const UpdatePostScreen({
    Key? key,
    required this.moodController,
    required this.detailController,
    required this.initialMood,
    required this.initialDetail,
    required this.postId, // postId 추가
  }) : super(key: key);

  @override
  ConsumerState<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends ConsumerState<UpdatePostScreen> {
  void onMoodEdited(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update Post"),
      ),
      body: Padding(
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
              child: TextFormField(
                textInputAction: TextInputAction.done,
                autofocus: false,
                maxLines: null,
                minLines: null,
                controller: widget.detailController,
                decoration: const InputDecoration(
                  hintText: "Write it down here!",
                  border: InputBorder.none,
                ),
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
            TextFormField(
              controller: widget.moodController,
              decoration: const InputDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            UpdateMoodContainer(
              onMoodEdited: onMoodEdited,
              moodController: widget.moodController,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink.shade200,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () async {
                    final newMood = widget.moodController.text;
                    final newDetail = widget.detailController.text;

                    Navigator.pop(context, {
                      "newMood": newMood,
                      "newDetail": newDetail,
                    });
                  },
                  child: const Text("저장"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
