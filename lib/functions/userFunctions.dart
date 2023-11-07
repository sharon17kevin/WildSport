import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/models/leagueModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/pointGameWeekModel.dart';

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
          'teamName': newUser.teamName,
          'password': await SecureStorage.readSecureData('password') as String,
        }),
    );
    if (response.statusCode == 200) {
      UserController userController = Get.find<UserController>();
      userController.signUpError.value = '';
      return {
        'body': response.body,
        'access-token': response.headers['x-auth-token']!
      };
    } else if (response.statusCode == 400) {
      UserController userController = Get.find<UserController>();
      userController.signUpError.value = response.body;
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
      UserController userController = Get.find<UserController>();
      userController.error.value = '';
      return {
        'body': response.body,
        'access-token': response.headers['x-auth-token']!
      };
    } else if (response.statusCode == 400) {
      UserController userController = Get.find<UserController>();
      userController.error.value = response.body;
    }else {
      throw Exception('Failed to load user');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future addFantasyPlayer(String url, User newUser, Player newPlayer, String title) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
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

Future bankUpdate(String url, User newUser) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': newUser.email,
        'bank': newUser.bank
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

Future pickTeam(String url, User newUser) async {
  UserController userController = Get.find<UserController>();
  dynamic keeper = userController.myFantasyTeam.checkAttributeName(userController.myPickedTeam['keeper']);
  List<dynamic> defenders = userController.myPickedTeam['defender'].map((e) => userController.myFantasyTeam.checkAttributeName(e)).toList();
  List<dynamic> midfielders = userController.myPickedTeam['midfielder'].map((e) => userController.myFantasyTeam.checkAttributeName(e)).toList();
  List<dynamic> attackers = userController.myPickedTeam['attacker'].map((e) => userController.myFantasyTeam.checkAttributeName(e)).toList();
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': newUser.email,
        'keeper' : keeper,
        'defender': defenders,
        'midfielder': midfielders,
        'attacker': attackers,
        'captain': userController.captain.value,
        'viceCaptain': userController.viceCaptain.value
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

Future getMe(String url, User user) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    final queryParameters = {'id': user.id};
    http.Response response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParameters),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
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

Future getThisUser(String url, String userID) async {
  try {
    final queryParameters = {'id': userID};
    http.Response response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParameters),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
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

Future deleteMe(String url, User user, String password) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    final queryParameters = {'id': user.id};
    http.Response response = await http.delete(
      Uri.parse(url).replace(queryParameters: queryParameters),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': password,
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

Future updateMe(String url, User user) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    final queryParameters = {'id': user.id};
    http.Response response = await http.put(
      Uri.parse(url).replace(queryParameters: queryParameters),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(user.toJson()),
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


Future getLeagueUsers(String url, List ids) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    final queryParameters = {'id': ids};
    http.Response response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParameters),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
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

Future updatePointGameWeek(String url, User newUser, PointGameWeek pgw) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': newUser.email,
        'gameweek': {
          "id": pgw.id,
          "number": pgw.number,
        }
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

Future fetchGameweek(String url, User user) async {
  try {
    List<String> gameWeeks = user.gameweek!.map((e) => e.id).toList();
    final queryParameters = {'id': gameWeeks};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future setFantasyData(String url, User newUser) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': newUser.email,
        'freeTransfer': newUser.freeTransfer,
        'freeHit': newUser.freeHit,
        'cost': newUser.cost,
        'wildcard': newUser.wildcard,
        'benchBoost': newUser.benchBoost
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

Future setPointGameweeks(String url, PointGameWeek pgw, List<PointGameWeek> pgws) async {
  List<String> ids = pgws.map((e) => e.id).toList();
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'ids': ids,
        'pointsGameWeek': {
          "number": 0,
          "cost": pgw.points,
          "points": pgw.points,
          "keeper": pgw.keeper,
          "defender": pgw.defender,
          "midfielder": pgw.midfielder,
          "attacker": pgw.attacker,
          "subKeeper": pgw.subKeeper,
          "substitution": pgw.substitution
        }
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

Future updateLeague(String url, User user , League league) async {
  final String authToken = await SecureStorage.readSecureData('token');
  try {
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken,
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'leagues': league.id,
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