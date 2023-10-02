import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/repos/post_repo.dart';
import 'package:flutter_semi_final/post/view_models/post_view_model.dart';

class UpdatePostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepository;

  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepo);
  }

  Future<void> updatePost(
    String postId,
    String newMood,
    String newDetail,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await _postRepository.updatePost(postId, newMood, newDetail);
        await ref.read(postProvider.notifier).refetch();
      },
    );
  }
}

final updatePostProvider = AsyncNotifierProvider<UpdatePostViewModel, void>(
  () => UpdatePostViewModel(),
);
