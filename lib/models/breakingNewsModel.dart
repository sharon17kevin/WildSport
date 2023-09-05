// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:wild_sport/models/authorModel.dart';

List<BreakingNews> breakingNewsFromJson(String str) => List<BreakingNews>.from(json.decode(str).map((x) => BreakingNews.fromJson(x)));

String breakingNewsToJson(List<BreakingNews> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreakingNews {
  Thumbnail thumbnail;
  String id;
  String title;
  String subtitle;
  bool bookmark;
  String author;
  DateTime timestamp;
  String imageUrl;
  bool priority;
  int v;

  BreakingNews({
    required this.thumbnail,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.bookmark,
    required this.author,
    required this.timestamp,
    required this.imageUrl,
    required this.priority,
    required this.v,
  });

  factory BreakingNews.fromJson(Map<String, dynamic> json) => BreakingNews(
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    id: json["_id"],
    title: json["title"],
    subtitle: json["subtitle"],
    bookmark: json["bookmark"],
    author: json["author"],
    timestamp: DateTime.parse(json["timestamp"]),
    imageUrl: json["imageUrl"],
    priority: json["priority"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "_id": id,
    "title": title,
    "subtitle": subtitle,
    "bookmark": bookmark,
    "author": author,
    "timestamp": timestamp.toIso8601String(),
    "imageUrl": imageUrl,
    "priority": priority,
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
