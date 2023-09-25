import 'package:flutter/material.dart';
import 'package:flutter_semi_final/home_container.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home";
  static const routeURL = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🔥MOOD🔥"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              HomeContainer(
                mood: "😍",
                detail:
                    "Today I feel amazing! I really like Flutter, I love building beautiful things!",
                uploadTime: "30 minutes ago",
              ),
              SizedBox(
                height: 30,
              ),
              HomeContainer(
                mood: "😭",
                detail: "서울에 비가 많이 와요 ㅠㅠ",
                uploadTime: "1 day ago",
              ),
              SizedBox(
                height: 30,
              ),
              HomeContainer(
                mood: "🥳",
                detail: "It was my birthday today! I feel great!",
                uploadTime: "2 days ago",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
