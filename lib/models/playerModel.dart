import 'dart:convert';

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

List<Player> playerFromJson(String str) => List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
  Image image;
  int fantasyPrice;
  List<int>? points;
  String id;
  String name;
  String team;
  int age;
  int number;
  int appearances;
  int goals;
  int subs;
  int assists;
  int fantasyPoints;
  String position;
  int yellowCards;
  int redCards;
  int v;
  int cleanSheets;
  int currentFantasyPoints;
  int ownGoals;
  String imageUrl;
  final String uniqueKey;
  RxBool isCaptain = false.obs;
  RxBool isViceCaptain = false.obs;

  Player({
    required this.image,
    required this.fantasyPrice,
    this.points,
    required this.id,
    required this.name,
    required this.team,
    required this.age,
    required this.number,
    required this.appearances,
    required this.goals,
    required this.subs,
    required this.assists,
    required this.fantasyPoints,
    required this.position,
    required this.yellowCards,
    required this.redCards,
    required this.v,
    required this.cleanSheets,
    required this.currentFantasyPoints,
    required this.ownGoals,
    required this.imageUrl,
  }): uniqueKey = Uuid().v4();

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    image: Image.fromJson(json["image"]),
    fantasyPrice: json["fantasyPrice"],
    id: json["_id"],
    name: json["name"],
    team: json["team"],
    age: json["age"],
    number: json["number"],
    appearances: json["appearances"],
    points: List<int>.from(json["points"].map((x) => x)),
    goals: json["goals"],
    subs: json["subs"],
    assists: json["assists"],
    fantasyPoints: json["fantasyPoints"],
    position: json["position"],
    yellowCards: json["yellowCards"],
    redCards: json["redCards"],
    v: json["__v"],
    cleanSheets: json["cleanSheets"],
    currentFantasyPoints: json["currentFantasyPoints"],
    ownGoals: json["ownGoals"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
    "fantasyPrice": fantasyPrice,
    "points": List<dynamic>.from(points!.map((x) => x)),
    "_id": id,
    "name": name,
    "team": team,
    "age": age,
    "number": number,
    "appearances": appearances,
    "goals": goals,
    "subs": subs,
    "assists": assists,
    "fantasyPoints": fantasyPoints,
    "position": position,
    "yellowCards": yellowCards,
    "redCards": redCards,
    "__v": v,
    "cleanSheets": cleanSheets,
    "currentFantasyPoints": currentFantasyPoints,
    "ownGoals": ownGoals,
    "imageUrl": imageUrl,
  };
}

class Image {
  String name;
  String contentType;

  Image({
    required this.name,
    required this.contentType,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    name: json["name"],
    contentType: json["contentType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contentType": contentType,
  };
}
