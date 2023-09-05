import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));
String authorToJson(Author data) => json.encode(data.toJson());
List<Author> authorsFromJson(String str) => List<Author>.from(json.decode(str).map((x) => Author.fromJson(x)));

String authorsToJson(List<Author> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Author {
  Icon icon;
  String id;
  String name;
  int noOfArticles;
  String imageUrl;
  int v;

  Author({
    required this.icon,
    required this.id,
    required this.name,
    required this.noOfArticles,
    required this.imageUrl,
    required this.v,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    icon: Icon.fromJson(json["icon"]),
    id: json["_id"],
    name: json["name"],
    noOfArticles: json["noOfArticles"],
    imageUrl: json["imageUrl"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon.toJson(),
    "_id": id,
    "name": name,
    "noOfArticles": noOfArticles,
    "imageUrl": imageUrl,
    "__v": v,
  };
}

class Icon {
  String name;
  String contentType;

  Icon({
    required this.name,
    required this.contentType,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    name: json["name"],
    contentType: json["contentType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contentType": contentType,
  };
}