import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wild_sport/screens/fantasyscreen2.dart';
import 'package:wild_sport/screens/homescreen.dart';
import 'package:wild_sport/screens/morescreen.dart';
import 'package:wild_sport/screens/statscreen1.dart';
import 'package:wild_sport/tabs/match1.dart';

import '../components/newsn.dart';
import '../tabs/highlight.dart';

class HomeScreenN extends StatefulWidget {
  @override
  _HomeScreenNState createState() => _HomeScreenNState();
}

class _HomeScreenNState extends State<HomeScreenN> {
  List _tabOptions = [
    ["News", NewsN()],
    ["Matches", Match1()],
    ["Highlights", Highlights()],
  ];

  List pages = [
    HomeScreen(),
    FantasyScreen2(),
    StatsScreen1(),
    MoreScreen(),
  ];

  var _currentIndex = 0;
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: _tabOptions.length,
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: isDark? Colors.white : Color(0xffCCB28F), width: 1)
            ),
            color: isDark? Color(0xff3D4455) : Colors.white,
          ),
          //Add  a shadow
          child: GNav(
            selectedIndex: _currentIndex,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            tabBackgroundColor: isDark? Colors.white : Color(0xff4A4138),
            backgroundColor: isDark? Color(0xff3D4455) : Colors.white,
            activeColor: isDark? Color(0xff525F4F) : Color(0xffCCB28F),
            color: isDark? Colors.white : Color(0xff4A4138),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: (){
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              GButton(
                text: 'Fantasy',
                icon: Icons.group,
                onPressed: (){
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.insights,
                text: 'Stats',
                onPressed: (){
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              GButton(
                icon: Icons.add,
                text: 'More',
                onPressed: (){
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}