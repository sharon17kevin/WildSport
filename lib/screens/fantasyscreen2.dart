import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FantasyScreen2 extends StatefulWidget {
  @override
  _FantasyScreen2State createState() => _FantasyScreen2State();
}

class _FantasyScreen2State extends State<FantasyScreen2> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 280,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff009CDE),
                          Color(0xffBFE6F7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      )
                    ),
                    height: 280,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -20),
                  child: Container(
                    width: 230,
                    height: 170,
                    child: Image.asset(
                      "assets/images/front2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                //<------------------------------Points Block ---------------------->
                Transform.translate(
                  offset: Offset(0, 70),
                  child: Container(
                    width: Get.width * 0.9,
                    height: 171,
                    decoration: BoxDecoration(
                      color: Color(0xff4A4238),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text("Gameweek 25",
                                      style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                      ),
                                    ),
                                    Text("Wednesday, Jan 5",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //<------------------------First Box--------------------->
                              Column(
                                children: [
                                  Text("Last",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              //<----------------------Second Box --------------------->
                              Column(
                                children: [
                                  Text('Points',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    width: 68,
                                    height: 68,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 66,
                                        height: 66,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(Radius.circular(9))
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Highest",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //<---------------------Logo Circle--------------------------->
                Transform.translate(
                  offset: Offset(0, -40),
                  child: Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xff4A4238),
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 25,
                  child: Container(
                      child: Text("FANTASY LEAGUE",
                        style: GoogleFonts.bebasNeue(
                          letterSpacing: 1,
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )
                      )
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 25,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 60),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Container(
                width: Get.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Actions",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Text("...",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.41,
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff9A96FF),
                                        Color(0xffF0D1FF),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                   ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.41,
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xff35A88D),
                                        Color(0xff9BCE76),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.41,
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffF65567),
                                        Color(0xffFEB779),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                    ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.41,
                            height: 105,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffDD5771),
                                        Color(0xffFEB779),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            color:  Colors.blue,
            child: Center(
              child: Container(
                width: Get.width * 0.95,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      width: 80,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      //margin: EdgeInsets.symmetric(vertical: 8),
                      child:                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Leagues",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text("...",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
        w * 0.5,
        h - 100,
        w,
        h
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
