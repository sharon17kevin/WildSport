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
  List<dynamic> homeGoalScorers;
  List<dynamic> homePenaltyScorers;
  List<dynamic> homePenaltyMissers;
  List<dynamic> homeOwnGoals;
  List<dynamic> homeRedCard;
  List<dynamic> homeYellowCard;
  List<dynamic> homeOffsides;
  List<dynamic> homeCorners;
  List<dynamic> awayGoalScorers;
  List<dynamic> awayPenaltyScorers;
  List<dynamic> awayPenaltyMissers;
  List<dynamic> awayOwnGoals;
  List<dynamic> awayRedCard;
  List<dynamic> awayYellowCard;
  List<dynamic> awayOffsides;
  List<dynamic> awayCorners;
  List<dynamic> homeLineUp;
  List<dynamic> awayLineUp;
  List<dynamic>? homeSubs;
  List<dynamic>? awaySubs;
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
    required this.homeGoalScorers,
    required this.homePenaltyScorers,
    required this.homePenaltyMissers,
    required this.homeOwnGoals,
    required this.homeRedCard,
    required this.homeYellowCard,
    required this.homeOffsides,
    required this.homeCorners,
    required this.awayGoalScorers,
    required this.awayPenaltyScorers,
    required this.awayPenaltyMissers,
    required this.awayOwnGoals,
    required this.awayRedCard,
    required this.awayYellowCard,
    required this.awayOffsides,
    required this.awayCorners,
    required this.homeLineUp,
    required this.awayLineUp,
    this.homeSubs,
    this.awaySubs,
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
    homeGoalScorers: List<dynamic>.from(json["homeGoalScorers"].map((x) => x)),
    homePenaltyScorers: List<dynamic>.from(json["homePenaltyScorers"].map((x) => x)),
    homePenaltyMissers: List<dynamic>.from(json["homePenaltyMissers"].map((x) => x)),
    homeOwnGoals: List<dynamic>.from(json["homeOwnGoals"].map((x) => x)),
    homeRedCard: List<dynamic>.from(json["homeRedCard"].map((x) => x)),
    homeYellowCard: List<dynamic>.from(json["homeYellowCard"].map((x) => x)),
    homeOffsides: List<dynamic>.from(json["homeOffsides"].map((x) => x)),
    homeCorners: List<dynamic>.from(json["homeCorners"].map((x) => x)),
    awayGoalScorers: List<dynamic>.from(json["awayGoalScorers"].map((x) => x)),
    awayPenaltyScorers: List<dynamic>.from(json["awayPenaltyScorers"].map((x) => x)),
    awayPenaltyMissers: List<dynamic>.from(json["awayPenaltyMissers"].map((x) => x)),
    awayOwnGoals: List<dynamic>.from(json["awayOwnGoals"].map((x) => x)),
    awayRedCard: List<dynamic>.from(json["awayRedCard"].map((x) => x)),
    awayYellowCard: List<dynamic>.from(json["awayYellowCard"].map((x) => x)),
    awayOffsides: List<dynamic>.from(json["awayOffsides"].map((x) => x)),
    awayCorners: List<dynamic>.from(json["awayCorners"].map((x) => x)),
    homeLineUp: List<dynamic>.from(json["homeLineUp"].map((x) => x)),
    awayLineUp: List<dynamic>.from(json["awayLineUp"].map((x) => x)),
    homeSubs: List<dynamic>.from(json["homeSubs"].map((x) => x)),
    awaySubs: List<dynamic>.from(json["awaySubs"].map((x) => x)),
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
    "homeGoalScorers": List<dynamic>.from(homeGoalScorers.map((x) => x)),
    "homePenaltyScorers": List<dynamic>.from(homePenaltyScorers.map((x) => x)),
    "homePenaltyMissers": List<dynamic>.from(homePenaltyMissers.map((x) => x)),
    "homeOwnGoals": List<dynamic>.from(homeOwnGoals.map((x) => x)),
    "homeRedCard": List<dynamic>.from(homeRedCard.map((x) => x)),
    "homeYellowCard": List<dynamic>.from(homeYellowCard.map((x) => x)),
    "homeOffsides": List<dynamic>.from(homeOffsides.map((x) => x)),
    "homeCorners": List<dynamic>.from(homeCorners.map((x) => x)),
    "awayGoalScorers": List<dynamic>.from(awayGoalScorers.map((x) => x)),
    "awayPenaltyScorers": List<dynamic>.from(awayPenaltyScorers.map((x) => x)),
    "awayPenaltyMissers": List<dynamic>.from(awayPenaltyMissers.map((x) => x)),
    "awayOwnGoals": List<dynamic>.from(awayOwnGoals.map((x) => x)),
    "awayRedCard": List<dynamic>.from(awayRedCard.map((x) => x)),
    "awayYellowCard": List<dynamic>.from(awayYellowCard.map((x) => x)),
    "awayOffsides": List<dynamic>.from(awayOffsides.map((x) => x)),
    "awayCorners": List<dynamic>.from(awayCorners.map((x) => x)),
    "homeLineUp": List<dynamic>.from(homeLineUp.map((x) => x)),
    "awayLineUp": List<dynamic>.from(awayLineUp.map((x) => x)),
    "homeSubs": List<dynamic>.from(homeSubs!.map((x) => x)),
    "awaySubs": List<dynamic>.from(awaySubs!.map((x) => x)),
    "__v": v,
  };
}
