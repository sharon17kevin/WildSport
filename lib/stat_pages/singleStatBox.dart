import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as Icon1;

class SingleStatBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TeamController _teamController = Get.find<TeamController>();
    List<Team> team = _teamController.getTeams;
    String title = Get.arguments['title'];
    Map infoMap = Get.arguments['infoMap'];
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    color: Color(0xff27AAE1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    )
                ),
                child: Text( title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Get.isDarkMode? Colors.black : Colors.white
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: infoMap.length,
                  itemBuilder: (BuildContext context, int index) {
                    final key = infoMap.keys.elementAt(index);
                    final value = infoMap[key];
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          team.firstWhere((obj) => obj.name == key).imageUrl,
                          height: 50,
                          width: 50,
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
                        ),
                      ),
                      title: Text('${key}',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Text('${value}',
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode? Colors.white : Colors.black
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
