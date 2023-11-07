import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:wild_sport/controllers/highlightsController.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/controllers/shortsController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/login.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;
  final UserController userController = Get.put(UserController());
  final TeamController teamController = Get.put(TeamController());
  final MatchesController matchesController = Get.put(MatchesController());
  final HighlightsController highlightsController = Get.put(HighlightsController());
  final BreakingNewsController _breakingNewsController = Get.put(BreakingNewsController());
  final ShortsController _shortsController = Get.put(ShortsController());

  Future<void> getUserID() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString('wildcard_user_id') ?? 'null';
    if (result == "null"){
      userController.isPreviousUser.value = false;
      print(result);
      Get.to(()=> Login());
    } else {
      //Get.to(()=> Login());
      userController.getThisUserCont(result).then((value){
        userController.generateFantasy();
        userController.isPreviousUser.value = true;
        print(result);
        Get.to(()=> HomeScreenN());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 2.0 * 3.14159265359
    ).animate(_controller);
    getUserID();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isPlatformDarkMode? Get.theme.primaryColor : Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/AFLlogo.webp',
                fit: BoxFit.fitHeight,
                height: 200,
                width: 200,
              ),
            )
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: Container(
              child: Text(
                'Powered By:\n Wildcard Sports',
                style: GoogleFonts.inter(
                  letterSpacing: 2,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode? Colors.white : Colors.black
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
