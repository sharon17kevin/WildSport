import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/models/playerModel.dart';

import '../models/userModel.dart';
final FlutterSecureStorage storage = const FlutterSecureStorage();

Future registerUser(String url, User newUser) async{
  try {
    http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'name': newUser.name,
          'email': newUser.email,
          'password': await SecureStorage.readSecureData('password') as String,
        }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future loginUser(String url, User newUser) async {
  try {
    http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'email': newUser.email,
          'password': await SecureStorage.readSecureData('password') as String,
        }),
    );
    if (response.statusCode == 200) {
      return {
        'body': response.body,
        'access-token': response.headers['x-auth-token']!
      };
    } else {
      throw Exception('Failed to load user');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future addFantasyPlayer(String url, User newUser, Player newPlayer, String title) async {
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'email': newUser.email,
        'fantasyTeam': {
          'player': newPlayer.id,
          'title': title,
        },
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  } catch(error) {
    throw Exception(error);
  }
}