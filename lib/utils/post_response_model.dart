import 'dart:convert';

List<PostResponseModel> postModelFromJson(String str) =>
    List<PostResponseModel>.from(
        json.decode(str).map((x) => PostResponseModel.fromJson(x)));

String postModelToJson(List<PostResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponseModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostResponseModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
