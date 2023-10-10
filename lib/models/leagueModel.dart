import 'dart:convert';

List<League> leagueFromJson(String str) => List<League>.from(json.decode(str).map((x) => League.fromJson(x)));

String leagueToJson(List<League> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class League {
  String name;
  List<String> players;
  String entryCode;

  League({
    required this.name,
    required this.players,
    required this.entryCode,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    name: json["name"],
    players: List<String>.from(json["players"].map((x) => x)),
    entryCode: json["entryCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "players": List<dynamic>.from(players.map((x) => x)),
    "entryCode": entryCode,
  };
}
