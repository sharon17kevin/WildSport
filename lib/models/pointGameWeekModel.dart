import 'dart:convert';

PointGameWeek pointGameWeekFromJson(String str) => PointGameWeek.fromJson(json.decode(str));

String pointGameWeekToJson(PointGameWeek data) => json.encode(data.toJson());

List<PointGameWeek> pointsGameWeekFromJson(String str) => List<PointGameWeek>.from(json.decode(str).map((x) => PointGameWeek.fromJson(x)));

String pointsGameWeekToJson(List<PointGameWeek> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PointGameWeek {
  int? cost;
  bool? wildcard;
  bool? benchBoost;
  bool? freeHit;
  bool? tripleCaptain;
  String id;
  int number;
  int points;
  String keeper;
  List<String> defender;
  List<String> midfielder;
  List<String> attacker;
  String subKeeper;
  List<String> substitution;
  int v;

  PointGameWeek({
    this.cost,
    this.wildcard,
    this.benchBoost,
    this.freeHit,
    this.tripleCaptain,
    required this.id,
    required this.number,
    required this.points,
    required this.keeper,
    required this.defender,
    required this.midfielder,
    required this.attacker,
    required this.subKeeper,
    required this.substitution,
    required this.v,
  });

  factory PointGameWeek.fromJson(Map<String, dynamic> json) => PointGameWeek(
    cost: json["cost"],
    wildcard: json["wildcard"],
    benchBoost: json["benchBoost"],
    freeHit: json["freeHit"],
    tripleCaptain: json["tripleCaptain"],
    id: json["_id"],
    number: json["number"],
    points: json["points"],
    keeper: json["keeper"],
    defender: List<String>.from(json["defender"].map((x) => x)),
    midfielder: List<String>.from(json["midfielder"].map((x) => x)),
    attacker: List<String>.from(json["attacker"].map((x) => x)),
    subKeeper: json["subKeeper"],
    substitution: List<String>.from(json["substitution"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "cost": cost,
    "wildcard": wildcard,
    "benchBoost": benchBoost,
    "freeHit": freeHit,
    "tripleCaptain": tripleCaptain,
    "_id": id,
    "number": number,
    "points": points,
    "keeper": keeper,
    "defender": List<dynamic>.from(defender.map((x) => x)),
    "midfielder": List<dynamic>.from(midfielder.map((x) => x)),
    "attacker": List<dynamic>.from(attacker.map((x) => x)),
    "subKeeper": subKeeper,
    "substitution": List<dynamic>.from(substitution.map((x) => x)),
    "__v": v,
  };
}
