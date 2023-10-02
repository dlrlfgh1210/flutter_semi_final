import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/models/post_model.dart';
import 'package:flutter_semi_final/post/repos/post_repo.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';

class CreatePostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepository;

  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepo);
  }

  Future<void> createMood(
    String post,
    String mood,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await _postRepository.createPost(
          PostModel(
            id: '',
            detail: post,
            mood: mood,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        await ref.read(postProvider.notifier).refetch();
      },
    );
  }
}

final createPostProvider = AsyncNotifierProvider<CreatePostViewModel, void>(
  () => CreatePostViewModel(),
);
