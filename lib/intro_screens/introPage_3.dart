import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wild_sport/components/textfield.dart';

class IntroPage_3 extends StatelessWidget {
  final Widget one;

  IntroPage_3({required this.one});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(0.15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Get.height * 0.5,
            child: Center(
              child: one
              // Lottie.network(
              //   "https://lottie.host/0ce0c1b9-3abc-4e10-995e-73996318c1b1/fpo3myHwfr.json"
              // ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: Get.height * 0.3,
            color: Colors.yellow.withOpacity(0.5),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Join the Fun",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                Text("Get started now, enjoy the thrill of fantasy sports and stay up to date with football news",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
