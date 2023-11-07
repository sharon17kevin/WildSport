import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:wild_sport/models/breakingNewsModel.dart';

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

Future postBreakingNews(String url, BreakingNews newNews, File image) async {
  var postUri = Uri.parse(url);
  var request = new http.MultipartRequest("POST", postUri);
  request.fields['title'] = newNews.title;
  request.fields['subtitle'] = newNews.subtitle;
  request.fields['bookmark'] = newNews.bookmark as String;
  request.fields['priority'] = newNews.priority as String;
  request.files.add(await http.MultipartFile.fromPath('thumbnail', image.path));
  var response = await http.Response.fromStream(await request.send());
  if (response.statusCode == 200) {
    print('News uploaded successfully');
    return response.body;
  } else {
    print('Failed to upload news');
  }
  // try {
  //   http.Response response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String> {
  //       'Content-Type': 'application/json; charset=UTF-8'
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "title": newNews.title,
  //       "subtitle": newNews.subtitle,
  //       "bookmark": newNews.bookmark,
  //       "priority": newNews.priority,
  //       "image":
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     throw Exception('Failed to load user');
  //   }
  // } catch(error) {
  //   throw Exception(error);
  // }
}
