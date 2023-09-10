import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchPlayers(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load team');
    }
  } catch(error) {
    throw Exception(error);
  }
}