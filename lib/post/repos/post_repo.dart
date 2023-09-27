import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_semi_final/post/models/post_model.dart';
import 'package:riverpod/riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePost(PostModel data) async {
    await _db.collection("posts").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPosts({
    int? lastItemCreatedAt,
  }) {
    final query = _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .limit(10);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
}

final postRepo = Provider((ref) => PostRepository());
