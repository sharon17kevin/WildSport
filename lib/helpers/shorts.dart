import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shorts extends StatelessWidget {
  dynamic image;
  dynamic title;
  Shorts({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: isDark? Colors.white : Color(0xffCCB28F), width: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(2,5)
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 250,
            width: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/football4.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  //Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black54,
                  Colors.black,
                ]
              )
            ),
            height: 250,
            width: 180,

          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.local_police),
            ),
          )
        ],
      ),
    );
  }
}
