import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/stat_pages/selectPlayer.dart';
import 'package:wild_sport/models/playerModel.dart' as PlayerImage;
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:flutter/src/widgets/icon.dart' as Icon1;
import 'package:wild_sport/models/teamsModel.dart' as TeamIcon;

class PlayerComparison extends StatefulWidget {
  @override
  _PlayerComparisonState createState() => _PlayerComparisonState();
}

class _PlayerComparisonState extends State<PlayerComparison> {
  @override
  Widget build(BuildContext context) {
    Player _defaultPlayer = Player(image: PlayerImage.Image(name: '', contentType: ''), id: '', name: 'Default', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: 'default', yellowCards: 0, redCards: 0, v: 1, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '', fantasyPrice: 0);
    var firstPlayer = _defaultPlayer.obs;
    var secondPlayer = _defaultPlayer.obs;
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
                  Icon1.Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Player Comparison'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Select two players to\n compare their stats',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          firstPlayer.value = await Get.to(() => SelectPlayer());
                        },
                        child: AddButton()
                      )
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () async {
                              secondPlayer.value = await Get.to(() => SelectPlayer());
                            },
                            child: AddButton()
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black26,
                              child: Obx(
                                ()=> Image1.Image.network(
                                  firstPlayer.value.imageUrl,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.softLight,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                      return Center(
                                        child: Image1.Image.asset(
                                          'assets/icons/imagePlaceholder.webp',
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
                                        'assets/icons/imagePlaceholder.webp',
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              color: Colors.black26,
                              child: Obx(
                                    ()=> Image1.Image.network(
                                  secondPlayer.value.imageUrl,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.softLight,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                      return Center(
                                        child: Image1.Image.asset(
                                          'assets/icons/imagePlaceholder.webp',
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
                                        'assets/icons/imagePlaceholder.webp',
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Obx(
                                ()=> PlayerOverview(
                                  player: firstPlayer.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              child: Obx(
                                ()=> PlayerOverview(
                                  player: secondPlayer.value,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: Get.isDarkMode? Color(0xff3D4455) : Color(0xff4A4138),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
              child: Icon1.Icon(Icons.add, size: 10,)
          ),
          SizedBox(width: 5,),
          Text('Click to add player',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}

class PlayerOverview extends StatelessWidget {
  final Player player;

  PlayerOverview({required this.player});
  @override
  Widget build(BuildContext context) {
    TeamController _teamController = Get.find<TeamController>();
    List<Team> teams = _teamController.getTeams;
    Team _defaultTeam = Team(icon: TeamIcon.Icon(name: '', contentType: ''), draw: 0, currentPosition: 0, id: '', name: 'Default', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      padding: EdgeInsets.all(5),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text('Player Overview',
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),
          ),
          PlayerTile(
            title: 'Name',
            value: player.name,
          ),
          PlayerTile(
            title: 'Team',
            value: teams.firstWhere((element) => element.id == player.team, orElse: ()=> _defaultTeam).name,
          ),
          PlayerTile(
            title: 'Age',
            value: player.age,
          ),
          PlayerTile(
            title: 'Number',
            value: player.number,
          ),
          PlayerTile(
            title: 'Position',
            value: player.position,
          ),
          PlayerTile(
            title: 'Goals',
            value: player.goals,
          ),
          PlayerTile(
            title: 'Assists',
            value: player.assists,
          ),
          PlayerTile(
            title: 'Sub Apps',
            value: player.subs,
          ),
          PlayerTile(
            title: 'Yellow Cards',
            value: player.yellowCards,
          ),
          PlayerTile(
            title: 'Red Cards',
            value: player.redCards,
          ),
          PlayerTile(
            title: 'Own Goals',
            value: player.ownGoals,
          ),
          PlayerTile(
            title: 'Clean Sheets',
            value: player.cleanSheets,
          )
        ],
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final String title;
  final dynamic value;

  PlayerTile({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
                child: Text(title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                )
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerRight,
              child: Text('$value',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}



