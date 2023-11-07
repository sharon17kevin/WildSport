import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage_1 extends StatefulWidget {
  final Widget one;
  final Widget two;

  IntroPage_1({required this.one, required this.two});
  @override
  State<IntroPage_1> createState() => _IntroPage_1State();
}

class _IntroPage_1State extends State<IntroPage_1> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation1 = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0.6, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation2 = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-0.6, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFEB779).withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            height: Get.height * 0.5,
            child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        SlideTransition(
                          position: _slideAnimation1,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              width: 170,
                              height: 215,
                              child: Center(
                                child: widget.two
                                // Lottie.network(
                                //     "https://lottie.host/3dada0e5-f661-448f-b953-08b0bc01f970/x0s1JryJWC.json"
                                // ),
                              ),
                            ),
                          ),
                        ),
                        SlideTransition(
                          position: _slideAnimation2,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              width: 170,
                              height: 200,
                              child: Center(
                                child: widget.one
                                // Lottie.network(
                                //   "https://lottie.host/3dada0e5-f661-448f-b953-08b0bc01f970/x0s1JryJWC.json"
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            )
          ),
          Container(
            width: double.maxFinite,
            height: Get.height * 0.3,
            color: Color(0xffFEB779).withOpacity(0.6),
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Stay Informed',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                Text("Get the latest match updates, news, player stats, and team updates to make informed decisions.",
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
