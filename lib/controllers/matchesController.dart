import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/functions/matchesFunctions.dart';

import '../themes/theme_constants.dart';

class MatchesController extends GetxController {
  var _fixtureList = <Match>[].obs;
  var _groupedFixture = {}.obs;

  get myGroupedFixture => _groupedFixture.value;

  // ignore: invalid_use_of_protected_member
  List<Match> get myMatches => _fixtureList.value;

  void updateFixtureList(List<Match> matches) {
    _fixtureList.value = matches;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchFixtures();
  }

  Future<void> fetchFixtures() async {
    try{
      var response = await fetchMatches('http://172.20.10.4:3000/api/matches');
      List<Match> fixtures = matchesFromJson(response);
      updateFixtureList(fixtures);
      var groupedMatches = groupBy(fixtures, (obj) => obj.date);
      _groupedFixture.value = groupedMatches;
    }catch(error) {
      throw Exception(error);
    }
  }
}