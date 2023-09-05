
import 'dart:convert';

List<Short> shortFromJson(String str) => List<Short>.from(json.decode(str).map((x) => Short.fromJson(x)));

String shortToJson(List<Short> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Short {
  Icon icon;
  Icon thumbnail;
  Icon video;
  String id;
  int v;

  Short({
    required this.icon,
    required this.thumbnail,
    required this.video,
    required this.id,
    required this.v,
  });

  factory Short.fromJson(Map<String, dynamic> json) => Short(
    icon: Icon.fromJson(json["icon"]),
    thumbnail: Icon.fromJson(json["thumbnail"]),
    video: Icon.fromJson(json["video"]),
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon.toJson(),
    "thumbnail": thumbnail.toJson(),
    "video": video.toJson(),
    "_id": id,
    "__v": v,
  };
}

class Icon {
  String name;
  String contentType;

  Icon({
    required this.name,
    required this.contentType,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    name: json["name"],
    contentType: json["contentType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contentType": contentType,
  };
}
