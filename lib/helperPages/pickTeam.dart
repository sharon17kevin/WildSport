import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/helperPages/pickTeam1.dart';
import 'package:wild_sport/helpers/drawerCard.dart';

class PickTeam extends StatefulWidget {
  @override
  _PickTeamState createState() => _PickTeamState();
}

class _PickTeamState extends State<PickTeam> {
  UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _userController.generateFantasy(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SafeArea(
              child: PickTeam1(),
            );
          }
        }
      ),
    );
  }
}
