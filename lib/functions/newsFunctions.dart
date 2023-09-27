import 'package:http/http.dart' as http;
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:get/get.dart';
import 'dart:convert';

Future fetchBreakingNews(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load news');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future fetchNewsAuthorSpecific(String url, List<String> ids) async {
  try {
    final queryParameters = {'id': ids.join(',')};
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load news author');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future fetchNewsAuthor(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load news author');
    }
  } catch(error) {
    throw Exception(error);
  }
}

Future updateBookmark(bool flag, ids) async {
  final String apiUrl = 'http://172.20.10.3:3000/api/newsBlocks/bookmark';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final queryParameters = {'id': ids.join(',')};
  final Map<String, bool> data = {
    'bookmark': flag,
  };

  final http.Response response = await http.put(
    Uri.parse(apiUrl).replace(queryParameters: queryParameters),
    headers: headers,
    body: json.encode(data), // Convert the data to JSON
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load news author');
  }
}
