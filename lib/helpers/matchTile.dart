import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/home_pages/matchPage.dart';
import 'package:wild_sport/home_pages/matchPage1.dart';
import 'package:wild_sport/models/matchesModel.dart';

class MatchTile extends StatelessWidget {
  final Match match;
  final TeamController _teamController = Get.find<TeamController>();

  MatchTile({super.key, required this.match});
  bool isDark = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanEnd: null,
      onPanUpdate: null,
      onPanStart: null,
      onTap: (){
        Get.to(MatchPage1(),
          arguments: {
            'match': match
          }
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 4),
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark? Colors.white10 : Colors.black12,
              width: 1,
            )
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.homeTeam
                      ).name,
                      //match.homeTeam
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                        _teamController.getTeams.firstWhere(
                                (obj) => obj.id == match.homeTeam
                        ).imageUrl,
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  //Icon(Icons.add_location)
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Score"),
                  Text("Time"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.awayTeam
                      ).imageUrl,
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  //Icon(Icons.add_location),
                  Text(
                    _teamController.getTeams.firstWhere(
                            (obj) => obj.id == match.awayTeam
                    ).name,
                      //match.awayTeam
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
