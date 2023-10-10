import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/fantasyPages/statisticsRow.dart';
import 'package:wild_sport/models/tableRow.dart';

class Statistics extends StatelessWidget {
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
        title: Text('Statistics'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatisticRow(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
