class PostModel {
  final String detail;
  final String mood;
  final int createdAt;

  PostModel({
    required this.detail,
    required this.mood,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "detail": detail,
      "mood": mood,
      "createdAt": createdAt,
    };
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : detail = json["detail"],
        mood = json["mood"],
        createdAt = json["createdAt"];
}
