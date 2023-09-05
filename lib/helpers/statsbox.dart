import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/helpers/highStats.dart';

Widget StatsBox(String category, String amount, context) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HighStats()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width - 2 * 42,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/football4.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: isDark? Color(0xff1F2024) : Color(0xffF7F7F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.call_made, size: 25,),
                onPressed: (){},
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 2 * 42,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff4A4138).withOpacity(0.3),
                  ),
                  height: 65,
                  padding: EdgeInsets.all(2),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(amount,
                            style: Get.theme.textTheme.titleLarge?.copyWith(
                              fontSize: 22,
                            )
                          ),
                          Text(category,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}