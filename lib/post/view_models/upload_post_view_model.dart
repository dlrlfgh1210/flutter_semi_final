import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/models/post_model.dart';
import 'package:flutter_semi_final/post/repos/post_repo.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';

class UploadPostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepository;

  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepo);
  }

  Future<void> uploadMood(
      String post, String mood, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final postId = DateTime.now().millisecondsSinceEpoch;

        await _postRepository.savePost(
          PostModel(
            detail: post,
            mood: mood,
            createdAt: postId,
          ),
        );
        await ref.read(postProvider.notifier).refetch();
      },
    );
  }
}

final uploadPostProvider = AsyncNotifierProvider<UploadPostViewModel, void>(
  () => UploadPostViewModel(),
);
