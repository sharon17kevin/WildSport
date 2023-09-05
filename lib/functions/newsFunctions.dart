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