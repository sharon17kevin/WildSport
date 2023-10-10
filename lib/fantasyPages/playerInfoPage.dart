import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/models/playerModel.dart' as PlayerImage;
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:flutter/src/widgets/icon.dart' as Icon1;
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as TeamIcon;
import 'package:wild_sport/stat_pages/player_comparison.dart';

class PlayerInfoPage extends StatelessWidget {
  final Player player;

  PlayerInfoPage({required this.player});
  @override
  Widget build(BuildContext context) {
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
        title: Text('Player Info'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      child: Image1.Image.network(
                          player.imageUrl,
                          fit: BoxFit.fitHeight,
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

                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: PlayerOverview(
                  player: player,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
