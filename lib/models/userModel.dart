// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> usersFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String usersToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  List<FantasyTeam>? freeHitTeam;
  String? freeHitKeeper;
  List<dynamic>? freeHitDefender;
  List<dynamic>? freeHitMidfielder;
  List<dynamic>? freeHitAttacker;
  int? bank;
  String? captain;
  String? viceCaptain;
  List<Gameweek>? gameweek;
  int? freeTransfer;
  int? wildcard;
  int? freeHit;
  int? benchBoost;
  int? tripleCaptain;
  int? cost;
  DateTime? date;

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
    this.freeHitTeam,
    this.freeHitKeeper,
    this.freeHitDefender,
    this.freeHitMidfielder,
    this.freeHitAttacker,
    this.bank,
    this.captain,
    this.viceCaptain,
    this.gameweek,
    this.freeTransfer,
    this.wildcard,
    this.freeHit,
    this.benchBoost,
    this.tripleCaptain,
    this.cost,
    this.date,
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
    freeHitTeam: List<FantasyTeam>.from(json["freeHitTeam"].map((x) => FantasyTeam.fromJson(x))),
    freeHitKeeper: json["freeHitKeeper"],
    freeHitDefender: List<String>.from(json["freeHitDefender"].map((x) => x)),
    freeHitMidfielder: List<String>.from(json["freeHitMidfielder"].map((x) => x)),
    freeHitAttacker: List<String>.from(json["freeHitAttacker"].map((x) => x)),
    bank: json["bank"],
    captain: json["captain"],
    viceCaptain: json["viceCaptain"],
    gameweek: List<Gameweek>.from(json["gameweek"].map((x) => Gameweek.fromJson(x))),
    freeTransfer: json["freeTransfer"],
    wildcard: json["wildcard"],
    freeHit: json["freeHit"],
    benchBoost: json["benchBoost"],
    tripleCaptain: json["tripleCaptain"],
    cost: json["cost"],
    date: DateTime.parse(json["date"]),
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
    "freeHitTeam": List<dynamic>.from(freeHitTeam!.map((x) => x.toJson())),
    "freeHitKeeper": freeHitKeeper,
    "freeHitDefender": List<dynamic>.from(freeHitDefender!.map((x) => x)),
    "freeHitMidfielder": List<dynamic>.from(freeHitMidfielder!.map((x) => x)),
    "freeHitAttacker": List<dynamic>.from(freeHitAttacker!.map((x) => x)),
    "bank": bank,
    "captain": captain,
    "viceCaptain": viceCaptain,
    "gameweek": List<dynamic>.from(gameweek!.map((x) => x.toJson())),
    "freeTransfer": freeTransfer,
    "wildcard": wildcard,
    "freeHit": freeHit,
    "benchBoost": benchBoost,
    "tripleCaptain": tripleCaptain,
    "cost": cost,
    "date": date?.toIso8601String(),
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

class Gameweek {
  String id;
  int number;

  Gameweek({
    required this.id,
    required this.number,
  });

  factory Gameweek.fromJson(Map<String, dynamic> json) => Gameweek(
    id: json["id"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
  };
}


