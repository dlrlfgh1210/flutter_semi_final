import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_semi_final/post/models/post_model.dart';
import 'package:flutter_semi_final/post/repos/post_repo.dart';

class PostViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepository _postRepository;
  List<PostModel> _list = [];
  int? lateItemCreatedAt;

  Future<List<PostModel>> _fetchPosts({int? lastItemCreatedAt}) async {
    final result = await _postRepository.fetchPosts(
      lastItemCreatedAt: lastItemCreatedAt ?? lateItemCreatedAt,
    );
    lateItemCreatedAt = lateItemCreatedAt;
    final posts = result.docs.map((doc) {
      return PostModel.fromJson(
        doc.data(),
      );
    });
    return posts.toList();
  }

  Future<void> refetch() async {
    final post = await _fetchPosts();
    state = AsyncValue.data(post);
  }

  @override
  FutureOr<List<PostModel>> build() async {
    _postRepository = ref.read(postRepo);
    _list = await _fetchPosts(lastItemCreatedAt: null);
    return _list;
  }

  fetchNextPage() async {
    final nextPage = await _fetchPosts(lastItemCreatedAt: _list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextPage]);
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
