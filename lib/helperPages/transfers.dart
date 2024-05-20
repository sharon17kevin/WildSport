import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/helperPages/transfers1.dart';
import '../helpers/drawerCard.dart';

class Transfers extends StatefulWidget {
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  var xOffset = 0.obs;
  var yOffset = 0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpen = false.obs;
  TeamController teamController = Get.find<TeamController>();
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
          future: userController.generateFantasy(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                child: Stack(
                  children: [
                    DrawerCard(),
                    Transfers1()
                  ],
                ),
              );
            }
          }
      ),
    );
  }
}
