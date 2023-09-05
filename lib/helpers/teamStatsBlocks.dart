import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/themes/theme_manager.dart';

class TeamStatsBlocks extends StatelessWidget {
  dynamic team;
  dynamic category;
  dynamic stat;
  TeamStatsBlocks({
    Key? key,
    required this.team,
    required this.category,
    required this.stat
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return Container(
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
              team,
              Text("Sample Name"),
              Text(category),
              Text(stat)
            ],
          ),
          Icon(Icons.local_police,
            size: 100,
            color: Get.theme.primaryColorDark,
          )
        ],
      ),
    );
  }
}
