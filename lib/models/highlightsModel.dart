import 'dart:convert';

List<Highlight> highlightsFromJson(String str) => List<Highlight>.from(json.decode(str).map((x) => Highlight.fromJson(x)));

String highlightsToJson(List<Highlight> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Highlight {
  Thumbnail thumbnail;
  Thumbnail video;
  String id;
  String title;
  int v;

  Highlight({
    required this.thumbnail,
    required this.video,
    required this.id,
    required this.title,
    required this.v,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    video: Thumbnail.fromJson(json["video"]),
    id: json["_id"],
    title: json["title"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "video": video.toJson(),
    "_id": id,
    "title": title,
    "__v": v,
  };
}

class Thumbnail {
  String name;
  String contentType;

  Thumbnail({
    required this.name,
    required this.contentType,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    name: json["name"],
    contentType: json["contentType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contentType": contentType,
  };
}