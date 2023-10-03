import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeContainer extends StatelessWidget {
  final String mood, detail;
  final int uploadTime;
  const HomeContainer({
    super.key,
    required this.mood,
    required this.detail,
    required this.uploadTime,
  });

  String _getFormattedTime() {
    final DateTime now = DateTime.now();
    final DateTime uploadDateTime =
        DateTime.fromMillisecondsSinceEpoch(uploadTime);
    final Duration difference = now.difference(uploadDateTime);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} 분 전';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} 시간 전';
    } else {
      return DateFormat('MM월 dd일').format(uploadDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 400,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                offset: Offset(-2, 5),
              )
            ],
            border: Border.all(
              color: Colors.black,
              width: 2,
              style: BorderStyle.solid,
            ),
            color: Colors.green.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Mood:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      mood,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  detail,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          _getFormattedTime(),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
