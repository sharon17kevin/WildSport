// To parse this JSON data, do
//
//     final match = matchFromJson(jsonString);

import 'dart:convert';

List<Match> matchesFromJson(String str) => List<Match>.from(json.decode(str).map((x) => Match.fromJson(x)));

String matchesToJson(List<Match> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Match {
  bool updated;
  List<String> homeSubs;
  List<String> awaySubs;
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
  List<AwayGoalScorer> homeGoalScorers;
  List<AwayGoalScorer> homePenaltyScorers;
  List<AwayGoalScorer> homePenaltyMissers;
  List<AwayGoalScorer> homeOwnGoals;
  List<AwayGoalScorer> homeRedCard;
  List<AwayGoalScorer> homeYellowCard;
  List<dynamic> homeOffsides;
  int homeCorners;
  List<AwayGoalScorer> awayGoalScorers;
  List<AwayGoalScorer> awayPenaltyScorers;
  List<AwayGoalScorer> awayPenaltyMissers;
  List<AwayGoalScorer> awayOwnGoals;
  List<AwayGoalScorer> awayRedCard;
  List<AwayGoalScorer> awayYellowCard;
  List<dynamic> awayOffsides;
  int awayCorners;
  List<String> homeLineUp;
  List<String> awayLineUp;
  int v;

  Match({
    required this.updated,
    required this.homeSubs,
    required this.awaySubs,
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
    required this.v,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    updated: json["updated"],
    homeSubs: List<String>.from(json["homeSubs"].map((x) => x)),
    awaySubs: List<String>.from(json["awaySubs"].map((x) => x)),
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
    homeGoalScorers: List<AwayGoalScorer>.from(json["homeGoalScorers"].map((x) => AwayGoalScorer.fromJson(x))),
    homePenaltyScorers: List<AwayGoalScorer>.from(json["homePenaltyScorers"].map((x) => AwayGoalScorer.fromJson(x))),
    homePenaltyMissers: List<AwayGoalScorer>.from(json["homePenaltyMissers"].map((x) => AwayGoalScorer.fromJson(x))),
    homeOwnGoals: List<AwayGoalScorer>.from(json["homeOwnGoals"].map((x) => AwayGoalScorer.fromJson(x))),
    homeRedCard: List<AwayGoalScorer>.from(json["homeRedCard"].map((x) => AwayGoalScorer.fromJson(x))),
    homeYellowCard: List<AwayGoalScorer>.from(json["homeYellowCard"].map((x) => AwayGoalScorer.fromJson(x))),
    homeOffsides: List<dynamic>.from(json["homeOffsides"].map((x) => x)),
    homeCorners: json["homeCorners"],
    awayGoalScorers: List<AwayGoalScorer>.from(json["awayGoalScorers"].map((x) => AwayGoalScorer.fromJson(x))),
    awayPenaltyScorers: List<AwayGoalScorer>.from(json["awayPenaltyScorers"].map((x) => AwayGoalScorer.fromJson(x))),
    awayPenaltyMissers: List<AwayGoalScorer>.from(json["awayPenaltyMissers"].map((x) => AwayGoalScorer.fromJson(x))),
    awayOwnGoals: List<AwayGoalScorer>.from(json["awayOwnGoals"].map((x) => AwayGoalScorer.fromJson(x))),
    awayRedCard: List<AwayGoalScorer>.from(json["awayRedCard"].map((x) => AwayGoalScorer.fromJson(x))),
    awayYellowCard: List<AwayGoalScorer>.from(json["awayYellowCard"].map((x) => AwayGoalScorer.fromJson(x))),
    awayOffsides: List<dynamic>.from(json["awayOffsides"].map((x) => x)),
    awayCorners: json["awayCorners"],
    homeLineUp: List<String>.from(json["homeLineUp"].map((x) => x)),
    awayLineUp: List<String>.from(json["awayLineUp"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "homeSubs": List<dynamic>.from(homeSubs.map((x) => x)),
    "awaySubs": List<dynamic>.from(awaySubs.map((x) => x)),
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
    "homeGoalScorers": List<dynamic>.from(homeGoalScorers.map((x) => x.toJson())),
    "homePenaltyScorers": List<dynamic>.from(homePenaltyScorers.map((x) => x.toJson())),
    "homePenaltyMissers": List<dynamic>.from(homePenaltyMissers.map((x) => x.toJson())),
    "homeOwnGoals": List<dynamic>.from(homeOwnGoals.map((x) => x.toJson())),
    "homeRedCard": List<dynamic>.from(homeRedCard.map((x) => x.toJson())),
    "homeYellowCard": List<dynamic>.from(homeYellowCard.map((x) => x.toJson())),
    "homeOffsides": List<dynamic>.from(homeOffsides.map((x) => x)),
    "homeCorners": homeCorners,
    "awayGoalScorers": List<dynamic>.from(awayGoalScorers.map((x) => x.toJson())),
    "awayPenaltyScorers": List<dynamic>.from(awayPenaltyScorers.map((x) => x.toJson())),
    "awayPenaltyMissers": List<dynamic>.from(awayPenaltyMissers.map((x) => x.toJson())),
    "awayOwnGoals": List<dynamic>.from(awayOwnGoals.map((x) => x.toJson())),
    "awayRedCard": List<dynamic>.from(awayRedCard.map((x) => x.toJson())),
    "awayYellowCard": List<dynamic>.from(awayYellowCard.map((x) => x.toJson())),
    "awayOffsides": List<dynamic>.from(awayOffsides.map((x) => x)),
    "awayCorners": awayCorners,
    "homeLineUp": List<dynamic>.from(homeLineUp.map((x) => x)),
    "awayLineUp": List<dynamic>.from(awayLineUp.map((x) => x)),
    "__v": v,
  };
}

class AwayGoalScorer {
  String player;
  int time;

  AwayGoalScorer({
    required this.player,
    required this.time,
  });

  factory AwayGoalScorer.fromJson(Map<String, dynamic> json) => AwayGoalScorer(
    player: json["player"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "player": player,
    "time": time,
  };
}