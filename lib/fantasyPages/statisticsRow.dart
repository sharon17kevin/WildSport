import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';

class StatisticRow extends StatefulWidget {
  final double height;

  const StatisticRow({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  _StatisticRowState createState() => _StatisticRowState();
}

class _StatisticRowState extends State<StatisticRow> {
  TeamController _teamController = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    List<Player> teams = _teamController.getPlayers;
    return Container(
      child: Row(

      ),
    );
  }
}
