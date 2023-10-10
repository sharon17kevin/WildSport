import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wild_sport/models/pointGameWeekModel.dart';

Future postGameWeek(String url, PointGameWeek pointGameWeek) async {
  pointGameWeek;
  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(pointGameWeek.toJson())
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post points gameweek');
    }
  } catch(error) {
    throw Exception(error);
  }
}