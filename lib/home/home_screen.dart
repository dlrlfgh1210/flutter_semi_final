import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/home/home_container.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = "home";
  static const routeURL = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(postProvider).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) => const Center(
              child: Text("Could not load moods."),
            ),
        data: (posts) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("🔥MOOD🔥"),
            ),
            body: posts.isEmpty
                ? const Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: HomeContainer(
                          mood: posts[index].mood,
                          detail: posts[index].detail,
                          uploadTime: posts[index].createdAt.toString(),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => Container(
                      height: 20,
                    ),
                    itemCount: posts.length,
                  ),
          );
        });
  }
}
