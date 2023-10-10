import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/fantasyPages/pointPage.dart';
import 'package:wild_sport/fantasyPages/statistics.dart';
import 'package:wild_sport/helperPages/leagueTable.dart';
import 'package:wild_sport/helperPages/pickTeam.dart';
import 'package:wild_sport/helperPages/transfers.dart';
import 'package:wild_sport/helpers/leagueBox.dart';

class FantasyScreen2 extends StatefulWidget {
  @override
  _FantasyScreen2State createState() => _FantasyScreen2State();
}

class _FantasyScreen2State extends State<FantasyScreen2> {
  UserController _userController = Get.find<UserController>();

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 200,
        decoration: BoxDecoration(
            color: Get.isDarkMode? Colors.black : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text('Team Name: ${_userController.myUser.teamName}',
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bank: ${_userController.myUser.bank}',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.white : Colors.black
                        ),
                      ),
                      Text('Squad Value:',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.white : Colors.black
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Get.isDarkMode? Colors.white : Colors.black,
                      )
                    )
                  ),
                  child: Text('CHIPS',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Get.isDarkMode? Colors.white : Colors.black,
                      letterSpacing: 2
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChipButton(title: 'Wildcard'),
                      ChipButton(title: 'Free Hit'),
                      ChipButton(title: 'Bench Boost')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLeagueBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 150,
        decoration: BoxDecoration(
          color: Get.isDarkMode? Colors.black : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text('Join League'),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text('Create League'),
              )
            ],
          ),
        ),
      ),
    );
  }

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
                      color: Get.isDarkMode? Color(0xff2C2E3B) : Color(0xff4A4238),
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
                                      backgroundColor: Colors.black.withOpacity(0.2),
                                      child: Icon(Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.black.withOpacity(0.2),
                                      child: Icon(Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 16,
                                      ),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      color: Get.isDarkMode? Color(0xff16171D) : Color(0xff2C2721 ),
                                    ),
                                  )
                                ],
                              ),
                              //<----------------------Second Box --------------------->
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(()=>PointPage());
                                    },
                                    child: Row(
                                      children: [
                                        Text('Points',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(Icons.arrow_right_alt_outlined,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  Container(
                                    width: 68,
                                    height: 68,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 66,
                                      height: 66,
                                      decoration: BoxDecoration(
                                        color: Get.isDarkMode? Color(0xff16171D) : Color(0xff2C2721 ),
                                        borderRadius: BorderRadius.all(Radius.circular(9))
                                      ),
                                      alignment: Alignment.center,
                                      child: Text('- -',
                                        style: GoogleFonts.orbitron(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
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
                                      color: Get.isDarkMode? Color(0xff16171D) : Color(0xff2C2721 ),
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
                      color: Get.isDarkMode? Color(0xff2C2E3B) : Color(0xff4A4238),
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
                          "assets/images/AFLlogo.webp",
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
                          onPressed: (){
                            showBottomSheet();
                          },
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
                          GestureDetector(
                            onTap: (){
                              Get.to(() => Transfers());
                            },
                            child: Container(
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
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Transfer",
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/icons/transfer.webp',
                                            height: 15,
                                            width: 15,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      ),
                                      Text('Make changes to \nyour squad list',
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _userController.generateFantasy().then(
                                  (value) {
                                    _userController.genFantasyFlag.value = false;
                                  }
                              );
                              Get.to(() => PickTeam());
                            },
                            child: Container(
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
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Pick Team",
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/icons/pick.webp',
                                            height: 15,
                                            width: 15,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      ),
                                      Text('Pick that winning \ngame week line-up',
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
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
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> LeagueTable());
                            },
                            child: Container(
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
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Table",
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/icons/table.webp',
                                            height: 15,
                                            width: 15,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      ),
                                      Text('Check the standing\n of your teams',
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> Statistics());
                            },
                            child: Container(
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
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Statistics",
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/icons/pick.webp',
                                            height: 15,
                                            width: 15,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      ),
                                      Text('Check out player \nfantasy history',
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
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
            child: Center(
              child: Container(
                width: Get.width * 0.95,
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: Get.isDarkMode? Color(0xff2C2E3B) : Color(0xff4A4238),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Leagues",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              showLeagueBottomSheet();
                            },
                            child: Text("...",
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Rank",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Leagues",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    _userController.leagues.length == 0?
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Join or Create A League',
                        style: TextStyle(
                          color: Colors.white70
                        ),
                      ),
                    ):
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _userController.leagues.length,
                        itemBuilder: (context, index) {
                          return LeagueBox(
                            league: _userController.leagues.value[index],
                          );
                        },
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

class ChipButton extends StatelessWidget {
  final String title;

  ChipButton({required this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Background color
        foregroundColor: Colors.white, // Text color
        elevation: 0, // Elevation (shadow)
        padding: EdgeInsets.all(16), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Button border radius
        ),
      ),
      onPressed: (){},
      child: Text(title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 1
        ),
      ),
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
