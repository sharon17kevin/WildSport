import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/helpers/matchTile.dart';
import 'package:get/get.dart';
import 'package:wild_sport/home_pages/gameweekTile.dart';
import 'package:wild_sport/models/matchesModel.dart';

class MatchBox extends StatefulWidget {
  final List<Match> gameweek;

  MatchBox({required this.gameweek});

  @override
  State<MatchBox> createState() => _MatchBoxState();
}

class _MatchBoxState extends State<MatchBox> {
  late Map<DateTime?, List<Match>> matchdays;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchdays = groupBy(widget.gameweek, (obj) => obj.date);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border(
          top: BorderSide(
            color: isDark? Colors.white30 : Colors.black38,
            width: 1,
          ),
          bottom: BorderSide(
            color: isDark? Colors.white30 : Colors.black38,
            width: 1,
          )
        )
      ),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: matchdays.entries.map((entry) {
          return GameweekTile(
              dateTime: entry.key,
              matches: entry.value);
        }).toList(),
      ),
    );
  }
}
