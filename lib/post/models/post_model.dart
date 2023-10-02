class PostModel {
  final String id;
  final String detail;
  final String mood;
  final int createdAt;

  PostModel({
    required this.id,
    required this.detail,
    required this.mood,
    required this.createdAt,
  });

  PostModel.fromJson(
    Map<String, dynamic> json,
    String postId,
  )   : id = postId,
        detail = json["detail"],
        mood = json["mood"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "detail": detail,
      "mood": mood,
      "createdAt": createdAt,
    };
  }
}
