import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchTeams(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load field');
    }
  } catch(error) {
    throw Exception(error);
  }
}