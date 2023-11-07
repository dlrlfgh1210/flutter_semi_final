class PostModel {
  final String id;
  final String creatorUid;
  final String detail;
  final String mood;
  final int createdAt;

  PostModel({
    required this.id,
    required this.creatorUid,
    required this.detail,
    required this.mood,
    required this.createdAt,
  });

  PostModel.fromJson(
    Map<String, dynamic> json,
    String postId,
  )   : id = postId,
        creatorUid = json['creatorUid'],
        detail = json["detail"],
        mood = json["mood"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorUid': creatorUid,
      "detail": detail,
      "mood": mood,
      "createdAt": createdAt,
    };
  }
}
