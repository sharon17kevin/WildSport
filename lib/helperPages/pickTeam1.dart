import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/components/playerCard.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/playerModel.dart'as Image2;
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as Icon1;

class PickTeam1 extends StatefulWidget {
  @override
  _PickTeam1State createState() => _PickTeam1State();
}

class _PickTeam1State extends State<PickTeam1> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scaleFactor = 0.6;
      Navigator.of(context).pop();
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserController userController = Get.find<UserController>();
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    Fantasy fantasyTeam = userController.myFantasyTeam;
    Map<String, dynamic> lineUp = userController.myPickedTeam;
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return GestureDetector(
      onTap: closeDrawer,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(isDrawerOpen? 20 : 0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isDrawerOpen? 20 : 0),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: isDark? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text('Back',
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            ),
                          ),
                          Text('Pick Your Team',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: isDark? Colors.white : Color(0xff4A4138),
                              fontSize: 23,
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text('Save',
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage(
                            isDark? 'assets/images/fieldDark.png' : 'assets/images/fieldLight.png',
                          ),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: RefreshIndicator(
                      onRefresh: (){
                        return Future.delayed(Duration(seconds: 0));
                      },
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(1, (index) => PickedPlayerCard(
                                onClicked: openDrawer,
                                player: players.firstWhere((element) => element.id == lineUp['keeper'], orElse: ()=> defaultPlayer),
                                )
                              )
                              // [
                              //   PlayerCard(
                              //     onClicked: openDrawer,
                              //     player: fantasyTeam.keeper2,
                              //     position: 'keeper2',
                              //   ),
                              // ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.yellow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(lineUp['defender']!.length, (index) => PickedPlayerCard(
                                onClicked: openDrawer,
                                player: players.firstWhere((element) => element.id == lineUp['defender'][index], orElse: ()=> defaultPlayer),
                              ))
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(lineUp['midfield']!.length, (index) => PickedPlayerCard(
                                onClicked: openDrawer,
                                player: players.firstWhere((element) => element.id == lineUp['midfield'][index], orElse: ()=> defaultPlayer),
                              ))
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(lineUp['attacker']!.length, (index) => PickedPlayerCard(
                                onClicked: openDrawer,
                                player: players.firstWhere((element) => element.id == lineUp['attacker'][index], orElse: ()=> defaultPlayer),
                              ))
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 5
                    ),
                    decoration: BoxDecoration(
                      color: isDark? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                      border: Border(
                        top: BorderSide(
                          width: 2,
                          color: isDark? Colors.white : Color(0xffCCB28F)
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlayerCard(
                          onClicked: openDrawer,
                          player: fantasyTeam.attacker2,
                          position: 'attacker2',
                        ),
                        PlayerCard(
                          onClicked: openDrawer,
                          player: fantasyTeam.attacker2,
                          position: 'attacker2',
                        ),
                        PlayerCard(
                          onClicked: openDrawer,
                          player: fantasyTeam.attacker2,
                          position: 'attacker2',
                        ),
                        PlayerCard(
                          onClicked: openDrawer,
                          player: fantasyTeam.attacker2,
                          position: 'attacker2',
                        ),
                        PlayerCard(
                          onClicked: openDrawer,
                          player: fantasyTeam.attacker2,
                          position: 'attacker2',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickedPlayerCard extends StatelessWidget {
  final VoidCallback onClicked;
  final Player player;

  const PickedPlayerCard({
    Key? key,
    required this.onClicked,
    required this.player,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viceCaptain = false.obs;
    var captain = false.obs;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TeamController teamController = Get.find<TeamController>();
    UserController userController = Get.find<UserController>();
    List<Team> team = teamController.getTeams;
    Team defaultTeam = Team(icon: Icon1.Icon(name: '', contentType: ''), draw: 0, currentPosition: 0, id: '', name: '', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return GestureDetector(
      onTap: (){
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
                                child: Text('Substitute'),
                                onPressed: onClicked,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                child: Text('Full Profile'),
                                onPressed: (){},
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Obx(
                                    ()=> CheckboxListTile(
                                  title: Text('Captain',
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                  value: captain.value,
                                  onChanged: (value) {
                                    captain.value = value!;
                                    userController.updateCaptain(player.id);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Obx(
                                    ()=> CheckboxListTile(
                                  title: Text('Vice Captain',
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                  value: viceCaptain.value,
                                  onChanged: (value) {
                                    viceCaptain.value = value!;
                                    userController.updateViceCaptain(player.id);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
                    child: player.imageUrl != ''?
                    Image1.Image.network(
                      team.firstWhere((element) => element.id == player.team, orElse: () => defaultTeam).imageUrl,
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
                  Positioned(
                    top: 2,
                    right: -5,
                    child: Obx(
                          ()=> Visibility(
                        visible: captain.value,
                        child: CircleAvatar(
                          backgroundColor: Get.isDarkMode? Colors.white : Color(0xff4A4138),
                          radius: 10,
                          child:  Text('C',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Get.isDarkMode? Colors.black : Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: -5,
                    child: Obx(
                          ()=> Visibility(
                        visible: userController.myCaptain == player.id,
                        child: CircleAvatar(
                          backgroundColor: Get.isDarkMode? Colors.white : Color(0xff4A4138),
                          radius: 10,
                          child:  Text('V',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Get.isDarkMode? Colors.black : Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
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

