import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage_2 extends StatelessWidget {
  final Widget one;

  IntroPage_2({required this.one});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Get.height * 0.5,
            child: Center(
              child: one
              // Lottie.network(
              //   "https://lottie.host/7ff63f62-01be-4af2-b075-1035b3241572/tYLsHqzlpV.json"
              // ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: Get.height * 0.3,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black38,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Compete with Friends',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
                Text("Challenge your friends and prove you have the best fantasy sports knowledge.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white54,
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
