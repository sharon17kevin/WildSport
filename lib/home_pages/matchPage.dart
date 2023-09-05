import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width * 0.97,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xff37003C),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 230,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Image.asset(
                          "assets/images/logo4.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 10,
                      child: Container(
                        width: 250,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff37003C).withOpacity(0),
                              Color(0xff37003C),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                          )
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: Get.width * 0.8,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text( "ABUAD Football League",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -125,
                      child: Container(
                        width: 350,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: Center(
                  child: Container(
                    width: Get.width * 0.85,
                    color: Colors.red,
                    height: 100,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
