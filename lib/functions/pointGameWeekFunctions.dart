import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wild_sport/models/pointGameWeekModel.dart';

Future postGameWeek(String url, PointGameWeek pointGameWeek) async {
  //pointGameWeek;
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

Future fetchHighestGameweek(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load players');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future updatePointGameWeekG(String url, PointGameWeek pointGameWeek) async {
  final queryParameters = {'id': pointGameWeek.id};
  try {
    http.Response response = await http.put(
        Uri.parse(url).replace(queryParameters: queryParameters),
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