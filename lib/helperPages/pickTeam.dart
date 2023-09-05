import 'package:flutter/material.dart';
import 'package:wild_sport/helperPages/pickTeam1.dart';
import 'package:wild_sport/helpers/drawerCard.dart';

class PickTeam extends StatefulWidget {
  @override
  _PickTeamState createState() => _PickTeamState();
}

class _PickTeamState extends State<PickTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DrawerCard(),
            PickTeam1()
          ],
        ),
      ),
    );
  }
}
