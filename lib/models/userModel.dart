// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String email;
  bool? admin;
  String? teamName;
  List<dynamic>? point;
  List<dynamic>? leagues;
  String? keeper;
  List<String>? defender;
  List<String>? midfielder;
  List<String>? attacker;
  List<FantasyTeam>? fantasyTeam;

  User({
    this.id,
    this.name,
    required this.email,
    this.admin,
    this.teamName,
    this.point,
    this.leagues,
    this.keeper,
    this.defender,
    this.midfielder,
    this.attacker,
    this.fantasyTeam,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    admin: json["admin"],
    teamName: json["teamName"],
    point: List<dynamic>.from(json["point"].map((x) => x)),
    leagues: List<dynamic>.from(json["leagues"].map((x) => x)),
    keeper: json["keeper"],
    defender: List<String>.from(json["defender"].map((x) => x)),
    midfielder: List<String>.from(json["midfielder"].map((x) => x)),
    attacker: List<String>.from(json["attacker"].map((x) => x)),
    fantasyTeam: List<FantasyTeam>.from(json["fantasyTeam"].map((x) => FantasyTeam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "admin": admin,
    "teamName": teamName,
    "point": List<dynamic>.from(point!.map((x) => x)),
    "leagues": List<dynamic>.from(leagues!.map((x) => x)),
    "keeper": keeper,
    "defender": List<dynamic>.from(defender!.map((x) => x)),
    "midfielder": List<dynamic>.from(midfielder!.map((x) => x)),
    "attacker": List<dynamic>.from(attacker!.map((x) => x)),
    "fantasyTeam": List<dynamic>.from(fantasyTeam!.map((x) => x.toJson())),
  };
}

class FantasyTeam {
  String player;
  String title;

  FantasyTeam({
    required this.player,
    required this.title,
  });

  factory FantasyTeam.fromJson(Map<String, dynamic> json) => FantasyTeam(
    player: json["player"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "player": player,
    "title": title,
  };
}
