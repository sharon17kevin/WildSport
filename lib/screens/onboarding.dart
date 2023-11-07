import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/intro_screens/introPage_1.dart';
import 'package:wild_sport/intro_screens/introPage_2.dart';
import 'package:wild_sport/intro_screens/introPage_3.dart';
import 'package:wild_sport/screens/homescreen1.dart';

class OnBoardingScreen extends StatefulWidget {
  final List<Widget> lottieAnimation;

  OnBoardingScreen({required this.lottieAnimation});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  var isFinal = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMe();
  }

  void getMe() async{
    UserController userController = Get.find<UserController>();
    await userController.getMeCont(userController.myUser);
  }

  @override
  Widget build(BuildContext context) {
    var activeIndex = 0.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage_1(
                one: widget.lottieAnimation[0],
                two: widget.lottieAnimation[1],
              ),
              IntroPage_2(
                one: widget.lottieAnimation[2],
              ),
              IntroPage_3(
                one: widget.lottieAnimation[3],
              )
            ],
            onPageChanged: (index) {
              activeIndex.value = index;
              isFinal.value = (index == 2);
            },
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Obx(
                    ()=> Text('Skip',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: activeIndex.value == 1? Colors.white : Colors.black
                      ),
                    ),
                  )
                ),
                Obx(
                  ()=> SmoothPageIndicator(
                    controller: _controller,
                    effect: SwapEffect(
                      radius: 5,
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor:  activeIndex.value == 1? Colors.black : Colors.white,
                      activeDotColor:  activeIndex.value == 1? Colors.white : Colors.black
                    ),
                    count: 3,
                  ),
                ),
                Obx(
                    ()=> isFinal.value? GestureDetector(
                        onTap: () {
                          Get.to(()=> HomeScreenN());
                        },
                        child: Text('Done',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          ),
                        )
                    )
                        :
                    GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('Next',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: activeIndex.value == 1? Colors.white : Colors.black
                          ),
                        )
                    ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
