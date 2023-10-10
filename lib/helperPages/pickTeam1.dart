import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/components/playerCard.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/fantasyPages/playerInfoPage.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/playerModel.dart'as Image2;
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as Icon1;
import 'package:wild_sport/screens/fantasyscreen2.dart';

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
    return ClipRRect(
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
                          if (userController.pickTeamUpdating.value == false) {
                            Get.back();
                          } else {
                            Get.dialog(
                                AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text('Have you saved your lineup?',
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                  content: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text('Save so you do not lose lineup',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        Get.back();
                                        Get.back();
                                        userController.pickTeamUpdating.value = false;
                                      },
                                      child: Text('Proceed',
                                          style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            letterSpacing: 1
                                          )
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Get.back();
                                      },
                                      child: Text('Continue',
                                          style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            letterSpacing: 1
                                          )
                                      ),
                                    ),
                                  ],
                                )
                            );
                          }
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
                        onPressed: () async{
                          userController.pickTeamUpdating.value = false;
                          await userController.updatePickTeam(userController.myUser);
                        },
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
                        child: GetBuilder<UserController>(
                          builder: (controller) {
                            return Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    ()=> PickedPlayerCard(
                                      outfield: true,
                                      onClicked: openDrawer,
                                      position: 'keeper',
                                      index: index,
                                      player: controller.myPickedTeam['keeper'],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        //color: Colors.yellow,
                        child: GetBuilder<UserController>(
                          builder: (controller) {
                            return Center(
                              child: Obx(
                                ()=> ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.myPickedTeam['defender']!.length,
                                  itemBuilder: (context, index) {
                                    return PickedPlayerCard(
                                      outfield: true,
                                      onClicked: openDrawer,
                                      position: 'defender',
                                      index: index,
                                      player: controller.myPickedTeam['defender'][index],//players.firstWhere((element) => element.id == controller.myPickedTeam['defender'][index], orElse: ()=> defaultPlayer),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        //color: Colors.red,
                        child: GetBuilder<UserController>(
                          builder: (controller) {
                            return Center(
                              child: Obx(
                                ()=> ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.myPickedTeam['midfielder']!.length,
                                  itemBuilder: (context, index) {
                                    return PickedPlayerCard(
                                      outfield: true,
                                      onClicked: openDrawer,
                                      position: 'midfielder',
                                      index: index,
                                      player: controller.myPickedTeam['midfielder'][index],//players.firstWhere((element) => element.id == controller.myPickedTeam['midfielder'][index], orElse: ()=> defaultPlayer),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        //color: Colors.blue,
                        child: GetBuilder<UserController>(
                          builder: (controller) {
                            return Center(
                              child: Obx(
                                ()=> ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.myPickedTeam['attacker']!.length,
                                  itemBuilder: (context, index) {
                                    return PickedPlayerCard(
                                      outfield: true,
                                      onClicked: openDrawer,
                                      position: 'attacker',
                                      index: index,
                                      player: controller.myPickedTeam['attacker'][index],//players.firstWhere((element) => element.id == controller.myPickedTeam['attacker'][index], orElse: ()=> defaultPlayer),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Obx(
                        ()=> PickedPlayerCard(
                          outfield: false,
                          onClicked: openDrawer,
                          position: "keeper",
                          index: 0,
                          player: userController.keeperSub.value!,//players.firstWhere((element) => element.id == userController.keeperSub.value, orElse: ()=> defaultPlayer),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 200,
                        child: GetBuilder<UserController>(
                          builder: (controller) {
                            return Center(
                              child: Obx(
                                ()=> ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.substitutes.value.length,
                                  itemBuilder: (context, index) {
                                    return PickedPlayerCard(
                                      outfield: false,
                                      onClicked: openDrawer,
                                      position: controller.substitutes.value[index]!.position,//players.firstWhere((element) => element.id == controller.substitutes.value[index], orElse: ()=> defaultPlayer).position,
                                      index: index,
                                      player: controller.substitutes.value[index]!,//players.firstWhere((element) => element.id == controller.substitutes.value[index], orElse: ()=> defaultPlayer),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PickedPlayerCard extends StatelessWidget {
  final VoidCallback onClicked;
  final Player player;
  final String position;
  final int index;
  final bool outfield;

  const PickedPlayerCard({
    Key? key,
    required this.onClicked,
    required this.player,
    required this.position,
    required this.index,
    required this.outfield,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viceCaptain = false.obs;
    var captain = false.obs;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TeamController teamController = Get.find<TeamController>();
    UserController userController = Get.find<UserController>();
    RxBool shouldIgnore(){
      if (outfield == false && userController.subbing.value == false){
        return true.obs;
      } else if (outfield == true && userController.subbing.value == true){
        return true.obs;
      } else if (position == 'keeper' && userController.subbing.value == true){
        return true.obs;
      }else {
        return false.obs;
      }
    }
    List<Team> team = teamController.getTeams;
    List<Player> players = teamController.getPlayers;
    Team defaultTeam = Team(icon: Icon1.Icon(name: '', contentType: ''), draw: 0, currentPosition: 0, id: '', name: '', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    return Obx(
        ()=> IgnorePointer(
        ignoring: shouldIgnore().value,
        child: GestureDetector(
          onTap: (){
            if (userController.subbing.value) {
              Map<String, dynamic> map = {
                'position': position,
                'id': player,
              };
              userController.subOn(map);
              userController.subbing.value = false;
              userController.pickTeamUpdating.value = true;
            } else {
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
                                      onPressed: () {
                                        if (position == 'keeper') {
                                          userController.switchKeeper();
                                          userController.pickTeamUpdating.value = true;
                                        } else {
                                          Map<String, dynamic> map = {
                                            'position': position,
                                            'id': player
                                          };
                                          userController.subOff(map);
                                          userController.pickTeamUpdating.value = true;
                                        }
                                        Navigator.of(context).pop();
                                      },
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
                                        Get.back();
                                        Get.to(()=> PlayerInfoPage(
                                          player: player,
                                        ));
                                      },
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
                                      ()=> IgnorePointer(
                                        ignoring: (player.id == '') || (viceCaptain.value == true),
                                        child: CheckboxListTile(
                                            title: Text('Captain',
                                        style: TextStyle(
                                            fontSize: 15
                                        ),
                                            ),
                                            value: captain.value,
                                            onChanged: (value) {
                                        captain.value = value!;
                                        if (captain.value == true) {
                                          userController.updateCaptain(player.id);
                                        } else {
                                          userController.updateCaptain('  ');
                                        }
                                            },
                                          ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Obx(
                                      ()=> IgnorePointer(
                                        ignoring: (player.id == '') || (captain.value == true),
                                        child: CheckboxListTile(
                                            title: Text('Vice Captain',
                                        style: TextStyle(
                                            fontSize: 15
                                        ),
                                            ),
                                            value: viceCaptain.value,//userController.viceCaptain.value == player.id,
                                            onChanged: (value) {
                                        viceCaptain.value = value!;
                                        if (viceCaptain.value == true) {
                                          userController.updateViceCaptain(player.id);
                                        } else {
                                          userController.updateViceCaptain('   ');
                                        }
                                            },
                                          ),
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
            }
          },
          child: Container(
            color: shouldIgnore().value? Colors.red.withOpacity(0.2) : Colors.transparent,
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
                              return
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Image1.Image.asset(
                                      'assets/icons/badgePlaceholderDark.webp',
                                      fit: BoxFit.contain,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                );
                            }
                          },
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Image1.Image.asset(
                                  'assets/icons/badgePlaceholderDark.webp',
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            );
                          },
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
                            visible: (userController.captain.value == player.id) && (!userController.substitutes.contains(player)),
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
                            visible: (userController.viceCaptain.value == player.id) && (!userController.substitutes.contains(player)),
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
                    child: Text(player.id != ""?
                    players.firstWhere((element) => element.id == player.id).name
                        :
                    'Default',
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
        ),
      ),
    );
  }
}

