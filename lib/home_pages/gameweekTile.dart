import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wild_sport/models/matchesModel.dart';
import '../helpers/matchTile.dart';

class GameweekTile extends StatelessWidget {
  final DateTime? dateTime;
  final List<Match> matches;

  const GameweekTile({super.key, required this.dateTime, required this.matches});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat('EEEE, MMM d, y').format(dateTime!)),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: matches.map((match){
            return MatchTile(
              match: match,
            );
          }).toList(),
        ),
      ],
    );
  }
}
