import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_semi_final/post/models/post_model.dart';
import 'package:riverpod/riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createPost(PostModel data) async {
    await _db.collection("posts").add(data.toJson());
  }

  Future<void> deletePost(String postId) async {
    await _db.collection("posts").doc(postId).delete();
  }

  Future<void> updatePost(
      String postId, String newMood, String newDetail) async {
    await _db.collection("posts").doc(postId).update({
      "mood": newMood,
      "detail": newDetail,
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPosts() {
    final query =
        _db.collection("posts").orderBy("createdAt", descending: true);
    return query.get();
  }
}

final postRepo = Provider((ref) => PostRepository());
