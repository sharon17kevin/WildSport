import 'dart:convert';
import 'package:get/get.dart';
import 'package:wild_sport/models/highlightsModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wild_sport/functions/highlightsFunctions.dart';
import 'package:wild_sport/models/matchesModel.dart';

class ManagementController extends GetxController {
  //Get The highest user for all gameWeeks
  //Get the lowest user for all gameWeeks
  late Rx<Match> updatingMatch = Match(id: '', date: DateTime.now(), hour: 0, minute: 0, awayScore: 0, homeScore: 0, awayTeam: '', homeTeam: '', gameWeek: 0, live: false, homeGoalScorers: [], homePenaltyScorers: [], homePenaltyMissers: [], homeOwnGoals: [], homeRedCard: [], homeYellowCard: [], homeOffsides: [], homeCorners: [], awayGoalScorers: [], awayPenaltyScorers: [], awayPenaltyMissers: [], awayOwnGoals: [], awayRedCard: [], awayYellowCard: [], awayOffsides: [], awayCorners: [], homeLineUp: [], awayLineUp: [], v: 0).obs;
}