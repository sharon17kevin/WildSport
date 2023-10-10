import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wild_sport/models/userModel.dart';

Future fetchLeague(String url, User user) async {
  try {
    final queryParameters = {'id': user.leagues?.join(',')};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load field');
    }
  } catch(error) {
    throw Exception(error);
  }
}