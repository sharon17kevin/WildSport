import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/stat_pages/season_stats.dart';

class PlayerStatsBlocks extends StatelessWidget {
  dynamic player;
  dynamic category;
  dynamic stat;
  final dynamic name;
  final dynamic id;
  PlayerStatsBlocks({
    Key? key,
    required this.id,
    required this.name,
    required this.player,
    required this.category,
    required this.stat
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TeamController _teamController = Get.find<TeamController>();
    String iconLink = _teamController.getTeams.firstWhere((element) => element.players.contains(id)).imageUrl;
    bool isDark = Get.isDarkMode;
    return GestureDetector(
      onTap: (){
        Get.to(()=> PlayerSeasonStats());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(
                color: isDark? Colors.white10 : Colors.black12,
                width: 1
            ),
            borderRadius: BorderRadius.circular(20),
            color: Get.theme.primaryColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  iconLink,
                  height: 40,
                  width: 40,
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                      return Center(
                        child: Image.asset(
                          'assets/icons/imagePlaceholder.webp',
                          fit: BoxFit.contain,
                          height: 40,
                          width: 40,
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Center(
                      child: Image.asset(
                        'assets/icons/imagePlaceholder.webp',
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                    );
                  },
                )
,
                Text(name),
                Text(category),
                Text('${stat}')
              ],
            ),
            Image.network(
              player,
              height: 100,
              width: 100,
              fit: BoxFit.fitWidth,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                  return Center(
                    child: Image.asset(
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
                  child: Image.asset(
                    'assets/icons/imagePlaceholder.webp',
                    fit: BoxFit.contain,
                    height: 50,
                    width: 50,
                  ),
                );
              },
            )
            // Icon(
            //   Icons.person,
            //   size: 100,
            //   color: Get.theme.primaryColorDark,
            // )
          ],
        ),
      ),
    );
  }
}
