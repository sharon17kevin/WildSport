import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/authorModel.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';
import 'package:wild_sport/functions/newsFunctions.dart';
import 'dart:collection';

import '../themes/theme_constants.dart';

class BreakingNewsController extends GetxController {
  var flag = false.obs;
  var _generalNews = <BreakingNews>[].obs;
  var _breakingNews = <BreakingNews>[].obs;
  var _latestNews = <BreakingNews>[].obs;
  var _authors = <Author>[].obs;
  late Set<String> uniqueNames;
  String pather = '172.20.10.8:3000';

  // ignore: invalid_use_of_protected_member
  List<BreakingNews> get myBreakingNews => _breakingNews.value;
  // ignore: invalid_use_of_protected_member
  List<BreakingNews> get myLatestNews => _latestNews.value;
  // ignore: invalid_use_of_protected_member
  List<Author> get myAuthors => _authors.value;
  bool get myFlag => flag.value;

  void updateGeneralNews(List<BreakingNews> generalNews) {
    _generalNews.value = generalNews;
  }

  void updateNewsAuthors(List<Author> authors) {
    _authors.value = authors;
  }

  void toggleFlag(bool isDone) {
    flag.value = isDone;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchNews();
    await fetchAuthors();
  }

  Future<void> fetchNews() async {
    toggleFlag(false);
    try{
      var response = await fetchBreakingNews('http://$pather/api/newsBlocks');
      List<BreakingNews> generalNews = breakingNewsFromJson(response);
      updateGeneralNews(generalNews);
      uniqueNames = generalNews.map((object) => object.author as String).toSet();
    }catch(error) {
      throw Exception(error);
    }
    _breakingNews.value = _generalNews.where((item) => item.priority == true).toList();
    _latestNews.value = _generalNews.where((item) => item.priority == false).toList();
  }

  Future<void> fetchAuthorsSpecific() async {
    try{
      var response;
      fetchNewsAuthorSpecific('http://$pather/api/authors', uniqueNames.toList()).then(
              (value) {
            response = value;
            toggleFlag(true);
          }
      );
      List<Author> authors = authorsFromJson(response);
      updateNewsAuthors(authors);
    }catch(error) {
      throw Exception(error);
    }
    toggleFlag(true);
  }

  Future<void> fetchAuthors() async {
    try{
      var response = await fetchNewsAuthor('http://$pather/api/authors');
      List<Author> authors = authorsFromJson(response);
      updateNewsAuthors(authors);
    }catch(error) {
      throw Exception(error);
    }
    toggleFlag(true);
  }

  Future<void> putUpdateBookmark(bool flag, ids) async {
    try{
      var response = await updateBookmark(flag, ids);
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> postNews(BreakingNews newNews, File image) async {
    try{
      var response = await postBreakingNews('http://$pather/api/newsBlocks', newNews, image);
      await fetchNews();
    }catch(error) {
      throw Exception(error);
    }
    toggleFlag(true);
  }

}