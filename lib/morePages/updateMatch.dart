import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as MainIcon;

class UpdateMatch extends StatelessWidget {
  final Rx<Match> match;

  UpdateMatch({required this.match});
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Team> teams = teamController.getTeams;
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
                  MainIcon.Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Update Match'),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                width: double.maxFinite,
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(DateFormat('EEEE, MMM d, y').format(match.value.date)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 20,
                            child: Text('Home: ${teams.firstWhere((element) => element.id == match.value.homeTeam).name}'),
                          ),
                          Container(
                            height: 20,
                            child: Text('Away: ${teams.firstWhere((element) => element.id == match.value.awayTeam).name}'),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            teams.firstWhere(
                                    (obj) => obj.id == match.value.homeTeam
                            ).imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                return Center(
                                  child: Image.asset(
                                    'assets/icons/badgePlaceholder.webp',
                                    fit: BoxFit.contain,
                                    height: 25,
                                    width: 25,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Center(
                                child: Image.asset(
                                  'assets/icons/badgePlaceholder.webp',
                                  fit: BoxFit.contain,
                                  height: 25,
                                  width: 25,
                                ),
                              );
                            },
                          ),
                          Image.network(
                            teams.firstWhere(
                                    (obj) => obj.id == match.value.awayTeam
                            ).imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                return Center(
                                  child: Image.asset(
                                    'assets/icons/badgePlaceholder.webp',
                                    fit: BoxFit.contain,
                                    height: 25,
                                    width: 25,
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator()
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Center(
                                child: Image.asset(
                                  'assets/icons/badgePlaceholder.webp',
                                  fit: BoxFit.contain,
                                  height: 25,
                                  width: 25,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(()=> Text("${match.value.homeGoalScorers.length} : ${match.value.awayGoalScorers.length}",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                color: Colors.black38,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Home Line Up'),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return PlayerTile();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController gController = TextEditingController();
    TextEditingController aController = TextEditingController();
    TextEditingController oController = TextEditingController();
    TextEditingController mController = TextEditingController();
    TextEditingController pController = TextEditingController();
    TextEditingController yController = TextEditingController();
    TextEditingController rController = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 70,
      width: double.maxFinite,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('Default'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryBox(
                        category: 'Goal',
                        controller: gController,
                      ),
                      CategoryBox(
                        category: 'Assist',
                        controller: aController,
                      ),
                      CategoryBox(
                        category: 'OwnGoal',
                        controller: oController,
                      ),
                      CategoryBox(
                        category: 'Pen',
                        controller: pController,
                      ),
                      CategoryBox(
                        category: 'MissPen',
                        controller: mController,
                      ),
                      CategoryBox(
                        category: 'YellCard',
                        controller: yController,
                      ),
                      CategoryBox(
                        category: 'RedCard',
                        controller: rController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String category;
  final TextEditingController controller;

  CategoryBox({required this.category, required this.controller});
  String toTitleCase(String text) {
    if (text == null || text.isEmpty) {
      return "";
    }

    List<String> words = text.split(' ');
    List<String> titleCaseWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        titleCaseWords.add(word[0].toUpperCase() + word.substring(1).toLowerCase());
      }
    }

    return titleCaseWords.join(' ');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 50,
      height: 70,
      color: Colors.cyan,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${category}',
            style: TextStyle(
              fontSize: 10
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20, height: 1.5, color: Colors.black),
              cursorHeight: 25,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

