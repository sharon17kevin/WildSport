    //final deadline = deadlineFromJson(jsonString);
import 'dart:convert';

List<Deadline> deadlineFromJson(String str) => List<Deadline>.from(json.decode(str).map((x) => Deadline.fromJson(x)));

String deadlineToJson(List<Deadline> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deadline {
  String id;
  DateTime date;
  int gameweek;
  int v;

  Deadline({
    required this.id,
    required this.date,
    required this.gameweek,
    required this.v,
  });

  factory Deadline.fromJson(Map<String, dynamic> json) => Deadline(
    id: json["_id"],
    date: DateTime.parse(json["date"]),
    gameweek: json["gameweek"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date.toIso8601String(),
    "gameweek": gameweek,
    "__v": v,
  };
}