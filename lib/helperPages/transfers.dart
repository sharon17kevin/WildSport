import 'package:flutter/material.dart';
import 'package:wild_sport/helperPages/transfers1.dart';
import '../helpers/drawerCard.dart';

class Transfers extends StatefulWidget {
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DrawerCard(),
            Transfers1()
          ],
        ),
      ),
    );
  }
}
