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

class MoodContainer extends StatefulWidget {
  final ValueChanged<int> onMoodSelected;
  const MoodContainer({
    super.key,
    required this.onMoodSelected,
  });

  @override
  State<MoodContainer> createState() => _MoodContainerState();
}

class _MoodContainerState extends State<MoodContainer> {
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
                if (selectedIndex == index) {
                  selectedIndex = -1;
                } else {
                  selectedIndex = index;
                }
                widget.onMoodSelected(selectedIndex);
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
