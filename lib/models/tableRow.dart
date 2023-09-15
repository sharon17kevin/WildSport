import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as Icon1;

class Drow extends StatefulWidget {
  final double height;

  const Drow({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  _DrowState createState() => _DrowState();
}

class _DrowState extends State<Drow> {
  TeamController _teamController = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    List<Team> teams = _teamController.getTeamPoint;
    return Container(
      height: 625,
        child: Row(
          children: [
            Container(
              width: 40,
              child: TableColumn(
                infoList: List.generate(teams.length, (index) => index + 1),
                title: 'Pos',
              ),
            ),
            Container(
              width: 40,
              child: PositionColumn(
                title: '',
              ),
            ),
            Container(
              width: 120,
              child: TableColumn(
                infoList: teams.map((team) => team.name).toList(),
                title: 'Club',
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.points).toList(),
                          title: 'Pts',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.played).toList(),
                          title: 'Pl',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.win).toList(),
                          title: 'W',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.draw).toList(),
                          title: 'D',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.loss).toList(),
                          title: 'L',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.goalsAgainst).toList(),
                          title: 'GA',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team) => team.goals).toList(),
                          title: 'GF',
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: 50,
                        child: TableColumn(
                          infoList: teams.map((team){
                            return team.goals - team.goalsAgainst;
                          }).toList(),
                          title: 'GD',
                        ),
                      )
                    ],
                  )
                  ,
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class TableColumn extends StatelessWidget {
  final String title;
  final List infoList;
  TableColumn({required this.infoList, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            color: Colors.cyanAccent,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Text('${title}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.maxFinite,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                      '${infoList[index]}',
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PositionColumn extends StatelessWidget {
  final String title;
  PositionColumn({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            color: Colors.cyanAccent,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Text('${title}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 50,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Icon1.Icon(Icons.circle, size: 10,)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

