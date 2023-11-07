// To parse this JSON data, do
//
//     final league = leagueFromJson(jsonString);

import 'dart:convert';
League leagueFromJson(String str) => League.fromJson(json.decode(str));

String leagueToJson(League data) => json.encode(data.toJson());

List<League> leaguesFromJson(String str) => List<League>.from(json.decode(str).map((x) => League.fromJson(x)));

String leaguesToJson(List<League> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class League {
  String name;
  List<dynamic> players;
  String entryCode;
  String id;
  int v;

  League({
    required this.name,
    required this.players,
    required this.entryCode,
    required this.id,
    required this.v,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    name: json["name"],
    players: List<dynamic>.from(json["players"].map((x) => x)),
    entryCode: json["entryCode"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "players": List<dynamic>.from(players.map((x) => x)),
    "entryCode": entryCode,
    "_id": id,
    "__v": v,
  };
}