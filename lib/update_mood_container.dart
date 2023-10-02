import 'package:flutter/material.dart';

List<String> moods = [
  "😀",
  "😍",
  "😟",
  "🥳",
  "😭",
  "🤬",
  "😴",
  "🤮",
  "🤤",
  "😱",
  "😩",
  "😑",
];

class UpdateMoodContainer extends StatefulWidget {
  final ValueChanged<int> onMoodEdited;
  final TextEditingController moodController;
  const UpdateMoodContainer({
    super.key,
    required this.onMoodEdited,
    required this.moodController,
  });

  @override
  State<UpdateMoodContainer> createState() => _UpdateMoodContainerState();
}

class _UpdateMoodContainerState extends State<UpdateMoodContainer> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onMoodEdited(selectedIndex);

                widget.moodController.text = moods[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      offset: Offset(0, 5),
                    )
                  ],
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: selectedIndex == index ? Colors.green : Colors.white,
                ),
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(10),
                child: Text(
                  moods[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: moods.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 15),
      ),
    );
  }
}
