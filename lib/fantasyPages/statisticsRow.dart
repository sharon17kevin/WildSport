import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/icon.dart' as Icon1;
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/teamsModel.dart';

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
    List<Player> players = _teamController.getPlayers;
    return Container(
      height: Get.height*0.83,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              child: TableColumn(
                infoList: List.generate(players.length, (index) => index + 1),
                title: 'Pos',
              ),
            ),
            //Logo here
            Container(
              width: 40,
              child: LogoColumn(
                title: '',
                infoList: players.map((player) => player.team).toList(),
              ),
            ),
            Container(
              width: 120,
              child: TableColumn(
                infoList: players.map((player) => player.name).toList(),
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
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.fantasyPoints).toList(),
                          title: 'Pts',
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.fantasyPrice).toList(),
                          title: 'Pr',
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.age).toList(),
                          title: 'age',
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.goals).toList(),
                          title: 'Gls',
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.assists).toList(),
                          title: 'Ass',
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TableColumn(
                          infoList: players.map((player) => player.cleanSheets).toList(),
                          title: 'ClSh',
                        ),
                      ),
                    ],
                  )
                  ,
                ),
              ),
            )
          ],
        ),
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
    TeamController _teamController = Get.find<TeamController>();
    List<Player> players = _teamController.getPlayers;
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: players.length,
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
        ],
      ),
    );
  }
}

class LogoColumn extends StatelessWidget {
  final String title;
  final List infoList;
  LogoColumn({required this.title, required this.infoList});
  @override
  Widget build(BuildContext context) {
    TeamController _teamController = Get.find<TeamController>();
    List<Team> teams = _teamController.getTeams;
    List<Player> players = _teamController.getPlayers;
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              String logo = teams.firstWhere((element) => element.id == infoList[index]).imageUrl;
              return Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Image1.Image.network(
                    logo,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                        return Center(
                          child: Image1.Image.asset(
                            'assets/icons/badgePlaceholderDark.webp',
                            fit: BoxFit.contain,
                            height: 50,
                            width: 50,
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Center(
                        child: Image1.Image.asset(
                          'assets/icons/badgePlaceholderDark.webp',
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                        ),
                      );
                    },
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}
