import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchHighlights(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load highlights');
    }
  } catch(error) {
    throw Exception(error);
  }
}