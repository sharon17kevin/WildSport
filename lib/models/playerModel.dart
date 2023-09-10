// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

List<Player> playerFromJson(String str) => List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
  Image image;
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
  String imageUrl;

  Player({
    required this.image,
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
    required this.imageUrl,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    image: Image.fromJson(json["image"]),
    id: json["_id"],
    name: json["name"],
    team: json["team"],
    age: json["age"],
    number: json["number"],
    appearances: json["appearances"],
    goals: json["goals"],
    subs: json["subs"],
    assists: json["assists"],
    fantasyPoints: json["fantasyPoints"],
    position: json["position"],
    yellowCards: json["yellowCards"],
    redCards: json["redCards"],
    v: json["__v"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
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
