import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/fantasyPages/playerInfoPage.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/playerModel.dart'as Image2;
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as Icon1;

class PlayerCard extends StatefulWidget {
  final VoidCallback onClicked;
  final Player? player;
  final String position;

  const PlayerCard({
    Key? key,
    required this.onClicked,
    required this.player,
    required this.position
  }) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  var viceCaptain = false.obs;
  var captain = false.obs;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TeamController teamController = Get.find<TeamController>();
    UserController userController = Get.find<UserController>();
    List<Team> team = teamController.getTeams;
    Team defaultTeam = Team(icon: Icon1.Icon(name: '', contentType: ''), draw: 0, currentPosition: 0, id: '', name: '', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return GestureDetector(
      onTap: (){
        userController.updateToUpdate(widget.position);
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15)
              )
            ),
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      color: isDark? Colors.white : Color(0xffCCB28F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                child: Text('Transfer'),
                                onPressed: widget.onClicked,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                child: Text('Full Profile'),
                                onPressed: (){
                                  Get.to(PlayerInfoPage());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 7,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:Get.isDarkMode? Colors.white30 : Colors.black26,
                    child: widget.player!.imageUrl != ''?
                        Image1.Image.network(
                          team.firstWhere((element) => element.id == widget.player!.team, orElse: () => defaultTeam).imageUrl,
                          fit: BoxFit.fitWidth,
                          height: 100,
                          width: 200,
                        )
                        :
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image1.Image.asset(
                              'assets/icons/badgePlaceholderDark.webp',
                            fit: BoxFit.contain,
                            height: double.maxFinite,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                width: double.maxFinite,
                color: Color(0xff2F5233),
                child: Text('Default',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff94C973),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 2),
                width: double.maxFinite,
                child: Text('Fixture',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
