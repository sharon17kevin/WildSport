import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/fantasyModel.dart';

import '../components/playerCard.dart';

class Transfers1 extends StatefulWidget {
  @override
  _Transfers1State createState() => _Transfers1State();
}

class _Transfers1State extends State<Transfers1> {
  TeamController teamController = Get.find<TeamController>();
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    Fantasy fantasyTeam = userController.myFantasyTeam;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<UserController>(
      builder: (controller) {
        void closeDrawer() {
          controller.xOffset.value = 0.0;
          controller.yOffset.value = 0.0;
          controller.scaleFactor.value = 1.0;
          controller.isDrawerOpen.value = false;
          controller.update();
          FocusScope.of(context).unfocus();
        }
        void openDrawer() {
          controller.xOffset.value = 230.0;
          controller.yOffset.value = 150.0;
          controller.scaleFactor.value = 0.6;
          Navigator.of(context).pop();
          controller.isDrawerOpen.value = true;
          teamController.updateDisplayList(controller.myToUpdate);
          controller.update();
        }
        return GestureDetector(
          onTap: closeDrawer,
          child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(controller.isDrawerOpen.value? 20 : 0),
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
              transform: Matrix4.translationValues(controller.xOffset.value, controller.yOffset.value, 0)
                ..scale(controller.scaleFactor.value),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(controller.isDrawerOpen.value? 20 : 0),
                child: AbsorbPointer(
                  absorbing: controller.isDrawerOpen.value,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: isDark? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Back',
                                        style: TextStyle(
                                            fontSize: 10,
                                          color: Get.isDarkMode? Colors.white: Colors.black
                                        ),
                                      ),
                                    ),
                                    Text('Make Transfers',
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                        color: isDark? Colors.white : Color(0xff4A4138),
                                        fontSize: 23,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Get.isDarkMode? Colors.white : Color(0xff2F5233),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      width: 85,
                                      height: 50,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Bank:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Get.isDarkMode? Colors.black : Colors.white
                                              ),
                                            ),
                                            Obx(()=> Text('₦ ${userController.myUser.bank}m',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    color: Get.isDarkMode? Colors.black : Colors.white
                                                )
                                            ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Get.isDarkMode? Colors.white : Color(0xff2F5233),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      margin: EdgeInsets.only(left: 15),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Column(
                                        children: [
                                          Obx(
                                          ()=> Text(
                                            userController.myUser.freeTransfer == -1?
                                            'Transfer: ∞'
                                                :
                                            'Transfer: ${userController.myUser.freeTransfer}',
                                            style: TextStyle(
                                              fontSize: 13,
                                                color: Get.isDarkMode? Colors.black : Colors.white,
                                                fontWeight: FontWeight.w700
                                            ),
                                            overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).freeHit == true? Get.isDarkMode? Colors.white : Color(0xff2F5233) : Colors.blueGrey,
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Text(
                                          'Wild Card',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Get.isDarkMode? Colors.black : Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).freeHit == true? Get.isDarkMode? Colors.white : Color(0xff2F5233) : Colors.blueGrey,
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      margin: EdgeInsets.only(right: 15),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Text(
                                          'Free Hit',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Get.isDarkMode? Colors.black : Colors.white,
                                          fontWeight: FontWeight.w700
                                        ),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                                  isDark? 'assets/images/darkField.webp' : 'assets/images/lightField.webp',
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
                                  //color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.keeper1,
                                          position: 'keeper1',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.keeper2,
                                          position: 'keeper2',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 7,
                                  //color: Colors.yellow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.defender1,
                                          position: 'defender1',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.defender2,
                                          position: 'defender2',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.defender3,
                                          position: 'defender3',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.defender4,
                                          position: 'defender4',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.defender5,
                                          position: 'defender5',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 7,
                                  //color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.midfielder1,
                                          position: 'midfielder1',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.midfielder2,
                                          position: 'midfielder2',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.midfielder3,
                                          position: 'midfielder3',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.midfielder4,
                                          position: 'midfielder4',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.midfielder5,
                                          position: 'midfielder5',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 7,
                                  //color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.attacker1,
                                          position: 'attacker1',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.attacker2,
                                          position: 'attacker2',
                                        ),
                                      ),
                                      Obx(
                                        ()=> PlayerCard(
                                          onClicked: openDrawer,
                                          player: userController.myFantasyTeam.attacker3,
                                          position: 'attacker3',
                                        ),
                                      ),
                                    ],
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
                    ],
                  ),
                ),
              ),
            ),
        );
      }
    );
  }
}
