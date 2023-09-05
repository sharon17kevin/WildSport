import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/helperPages/pickTeam.dart';
import 'package:wild_sport/helperPages/transfers.dart';

class FantasyBlock extends StatelessWidget {
  final title;
  final icon;
  final info;
  final page;

  const FantasyBlock({Key? key, required this.title, required this.icon, required this.info, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _pages = [
      Transfers(),
      PickTeam()
    ];
    return Expanded(
      child: GestureDetector(
          onTap: () {
            Get.to(() => _pages[page]
            );
          },
        child: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title,
                    icon
                  ],
                ),
              ),
              Container(
                height: 2,
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: info
              )
            ],
          ),
        ),
      ),
    );
  }
}
