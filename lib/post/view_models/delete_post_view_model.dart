import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/repos/post_repo.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';

class DeletePostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepository;

  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepo);
  }

  Future<void> deletePost(
    String postId,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await _postRepository.deletePost(postId);
        await ref.read(postProvider.notifier).refetch();
      },
    );
  }
}

final deletePostProvider = AsyncNotifierProvider<DeletePostViewModel, void>(
  () => DeletePostViewModel(),
);
