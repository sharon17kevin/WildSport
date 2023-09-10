import 'package:flutter/material.dart';

class LeagueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(

            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
            ),
          ),
        ],
      ),
    );
  }
}
