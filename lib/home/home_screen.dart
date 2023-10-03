import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/view_models/update_post_view_model.dart';
import 'package:flutter_semi_final/update_post_screen.dart';
import 'package:flutter_semi_final/home/home_container.dart';
import 'package:flutter_semi_final/post/view_models/delete_post_view_model.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "home";
  static const routeURL = "/home";
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _onLongPress(String postId, String mood, String detail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("삭제 확인"),
          content: const Text("이 항목을 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () async {
                await ref.read(deletePostProvider.notifier).deletePost(
                      postId,
                      context,
                    );
                if (context.mounted) {
                  context.pop();
                }
              },
              child: const Text("삭제"),
            ),
            TextButton(
              onPressed: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePostScreen(
                      moodController: TextEditingController(text: mood),
                      detailController: TextEditingController(text: detail),
                      initialMood: mood,
                      initialDetail: detail,
                      postId: postId,
                    ),
                  ),
                );

                if (updatedData != null &&
                    updatedData.containsKey("newMood") &&
                    updatedData.containsKey("newDetail")) {
                  final newMood = updatedData["newMood"];
                  final newDetail = updatedData["newDetail"];

                  await ref
                      .read(updatePostProvider.notifier)
                      .updatePost(postId, newMood, newDetail);

                  await ref.read(postProvider.notifier).refetch();
                }
              },
              child: const Text("수정"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              body: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(postProvider.notifier).refetch();
                },
                child: posts.isEmpty
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
                            child: GestureDetector(
                              onLongPress: () => _onLongPress(
                                posts[index].id,
                                posts[index].mood,
                                posts[index].detail,
                              ),
                              child: HomeContainer(
                                mood: posts[index].mood,
                                detail: posts[index].detail,
                                uploadTime: posts[index].createdAt,
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) => Container(
                          height: 20,
                        ),
                        itemCount: posts.length,
                      ),
              ),
            );
          },
        );
  }
}
