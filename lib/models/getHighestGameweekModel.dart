import 'dart:convert';

List<GetHighestGameweek> getHighestGameweekFromJson(String str) => List<GetHighestGameweek>.from(json.decode(str).map((x) => GetHighestGameweek.fromJson(x)));

String getHighestGameweekToJson(List<GetHighestGameweek> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHighestGameweek {
  int id;
  int highest;

  GetHighestGameweek({
    required this.id,
    required this.highest,
  });

  factory GetHighestGameweek.fromJson(Map<String, dynamic> json) => GetHighestGameweek(
    id: json["_id"],
    highest: json["highest"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "highest": highest,
  };
}
