import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wild_sport/intro_screens/introPage_1.dart';
import 'package:wild_sport/intro_screens/introPage_2.dart';
import 'package:wild_sport/intro_screens/introPage_3.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage_1(),
              IntroPage_2(),
              IntroPage_3()
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('skip')
                ),
                SmoothPageIndicator(controller: _controller, count: 3,),
                GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text('next')
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
