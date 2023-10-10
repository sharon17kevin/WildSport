import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/fantasyPages/leaguePage.dart';
import 'package:wild_sport/models/leagueModel.dart';

class LeagueBox extends StatelessWidget {
  final League league;
  LeagueBox({required this.league});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(
            ()=> LeaguePage(league: league)
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  league.name,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Icon(Icons.arrow_right_alt,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
