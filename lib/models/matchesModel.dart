// To parse this JSON data, do
//
//     final match = matchFromJson(jsonString);

import 'dart:convert';

List<Match> matchesFromJson(String str) => List<Match>.from(json.decode(str).map((x) => Match.fromJson(x)));

String matchesToJson(List<Match> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Match {
  String id;
  DateTime date;
  int hour;
  int minute;
  int awayScore;
  int homeScore;
  String awayTeam;
  String homeTeam;
  int gameWeek;
  bool live;
  int v;

  Match({
    required this.id,
    required this.date,
    required this.hour,
    required this.minute,
    required this.awayScore,
    required this.homeScore,
    required this.awayTeam,
    required this.homeTeam,
    required this.gameWeek,
    required this.live,
    required this.v,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["_id"],
    date: DateTime.parse(json["date"]),
    hour: json["hour"],
    minute: json["minute"],
    awayScore: json["awayScore"],
    homeScore: json["homeScore"],
    awayTeam: json["awayTeam"],
    homeTeam: json["homeTeam"],
    gameWeek: json["gameWeek"],
    live: json["live"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date.toIso8601String(),
    "hour": hour,
    "minute": minute,
    "awayScore": awayScore,
    "homeScore": homeScore,
    "awayTeam": awayTeam,
    "homeTeam": homeTeam,
    "gameWeek": gameWeek,
    "live": live,
    "__v": v,
  };
}
