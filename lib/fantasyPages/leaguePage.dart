import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/leagueModel.dart';
import 'package:wild_sport/models/userModel.dart';

class LeaguePage extends StatelessWidget {
  final League league;

  LeaguePage({required this.league});
  void shareText(String text) {
    Share.share(text);
  }
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    List<LeagueUser> leagueUsers = userController.leagueUsers.where(
            (element) => league.players.contains(element.id)).toList().map(
            (e) => LeagueUser(name: e.name!, totalPoint: e.point!.reduce((value, element) => value + element))
    ).toList();
    leagueUsers.sort((a,b)=>b.totalPoint.compareTo(a.totalPoint));
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('League | Entry Code Below'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code:'),
              TextButton(
                  onPressed: (){
                    shareText(league.entryCode);
                  },
                  child: Text('${league.entryCode}',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        letterSpacing: 1,
                        color: Get.isDarkMode? Colors.white : Colors.black,
                        fontSize: 12
                    ),
                  )
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: userController.getLeagueUsersCont(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('No Team Data Available'));
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            height: 25,
                            width: double.maxFinite,
                            color: Colors.cyanAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pos',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                                Text('Team Name',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                                Text('Points',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: leagueUsers.length,//league.players.length,
                              itemBuilder: (context, index) {
                                //User currentUser = userController.leagueUsers.firstWhere((element) => element.id == league.players[index]);
                                return LeagueTile(
                                  index: index,
                                  title: leagueUsers[index].name,//userController.leagueUsers.firstWhere((element) => element.id == league.players[index]).name!,//currentUser.name!,
                                  points:  leagueUsers[index].totalPoint,//userController.leagueUsers.firstWhere((element) => element.id == league.players[index]).point!.reduce((value, element) => value + element),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LeagueUser {
  final String name;
  final int totalPoint;

  LeagueUser({required this.name, required this.totalPoint});
}

class LeagueTile extends StatelessWidget {
  final int index;
  final String title;
  final int points;

  LeagueTile({required this.index, required this.title, required this.points});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600
        ),
      ),
      title: Center(child: Text('$title',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600
        ),
      )),
      trailing: Text('$points',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

