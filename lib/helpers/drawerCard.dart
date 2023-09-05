import 'package:flutter/material.dart';
import 'package:wild_sport/helperPages/pickTeam1.dart';

class DrawerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 35,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.local_police),
              title: Text('Player_${index}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              contentPadding: EdgeInsets.all(20),
            );
          },
        ),
      ),
    );
  }
}
