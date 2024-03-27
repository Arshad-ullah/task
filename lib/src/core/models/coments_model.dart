class CommentModel {
  String? email;
  String? name;
  String? body;
  int? id;

  CommentModel({
    this.body,
    this.email,
    this.id,
    this.name,
  });

  CommentModel fromJson(json) {
    return CommentModel(
        body: json["body"],
        email: json["email"],
        id: json["id"],
        name: json["name"]);
  }
}
