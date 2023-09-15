// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'dart:convert';

List<Team> teamFromJson(String str) => List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String teamToJson(List<Team> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Team {
  Icon icon;
  int draw;
  int currentPosition;
  String id;
  String name;
  int played;
  int win;
  int loss;
  int goals;
  int points;
  String jersey;
  String imageUrl;
  int yellowCards;
  int redCards;
  List<String> players;
  int v;
  int cleanSheets;
  int goalsAgainst;

  Team({
    required this.icon,
    required this.draw,
    required this.currentPosition,
    required this.id,
    required this.name,
    required this.played,
    required this.win,
    required this.loss,
    required this.goals,
    required this.points,
    required this.jersey,
    required this.imageUrl,
    required this.yellowCards,
    required this.redCards,
    required this.players,
    required this.v,
    required this.cleanSheets,
    required this.goalsAgainst,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    icon: Icon.fromJson(json["icon"]),
    draw: json["draw"],
    currentPosition: json["currentPosition"],
    id: json["_id"],
    name: json["name"],
    played: json["played"],
    win: json["win"],
    loss: json["loss"],
    goals: json["goals"],
    points: json["points"],
    jersey: json["jersey"],
    imageUrl: json["imageUrl"],
    yellowCards: json["yellowCards"],
    redCards: json["redCards"],
    players: List<String>.from(json["players"].map((x) => x)),
    v: json["__v"],
    cleanSheets: json["cleanSheets"],
    goalsAgainst: json["goalsAgainst"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon.toJson(),
    "draw": draw,
    "currentPosition": currentPosition,
    "_id": id,
    "name": name,
    "played": played,
    "win": win,
    "loss": loss,
    "goals": goals,
    "points": points,
    "jersey": jersey,
    "imageUrl": imageUrl,
    "yellowCards": yellowCards,
    "redCards": redCards,
    "players": List<dynamic>.from(players.map((x) => x)),
    "__v": v,
    "cleanSheets": cleanSheets,
    "goalsAgainst": goalsAgainst,
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
