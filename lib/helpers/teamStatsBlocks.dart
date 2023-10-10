import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/stat_pages/season_stats.dart';
import 'package:wild_sport/themes/theme_manager.dart';

class TeamStatsBlocks extends StatelessWidget {
  dynamic name;
  dynamic team;
  dynamic category;
  dynamic stat;
  TeamStatsBlocks({
    Key? key,
    required this.name,
    required this.team,
    required this.category,
    required this.stat
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return GestureDetector(
      onTap: (){
        Get.to(()=>TeamSeasonStats());
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
                //team,
                Text(name,
                  style: GoogleFonts.bebasNeue(
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )

                ),
                Text(category),
                Text('${stat}',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Image.network(
              team,
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
            // Icon(Icons.local_police,
            //   size: 100,
            //   color: Get.theme.primaryColorDark,
            // )
          ],
        ),
      ),
    );
  }
}
