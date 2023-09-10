import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchTeams(String url) async {
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

Future fetchTeamsStats(String url, List<int> ids) async {
  try {
    final queryParameters = {'id': ids.join(',')};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load news team');
    }
  } catch(error) {
    throw Exception(error);
  }
}
