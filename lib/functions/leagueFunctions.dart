import 'package:http/http.dart' as http;
import 'package:wild_sport/models/leagueModel.dart';
import 'dart:convert';
import 'package:wild_sport/models/userModel.dart';

Future fetchLeague(String url, User user) async {
  try {
    final queryParameters = {'id': user.leagues};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load leagues');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future postLeague(String url,User user, String name, String code) async {
  try {
    http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'entryCode': code,
          'players': [user.id]
        }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post leagues');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future join(String url, User user, String code) async {
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'entryCode': code,
        'players': [user.id]
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post leagues');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future fetchSingleLeague(String url, String code) async {
  try {
    final queryParameters = {'entryCode': code};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return false;
      //throw Exception('Failed to load leagues');
    }
  } catch(error) {
    throw Exception(error);
  }
}