import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/tabs/highlight.dart';
import 'package:wild_sport/themes/theme_manager.dart';

import '../components/newsn.dart';
import '../tabs/match1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  List _tabOptions = [
    ["News", NewsN()],
    ["Matches", Match1()],
    ["Videos", Highlights()],
  ];
  List<Widget> tabs = [
    NewsN(),
    Match1(),
    Highlights(),
  ];
  
  @override
  void initState() {
    super.initState();
  }

  final tManager = Get.put(ThemeManager());
  
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    String toTitleCase(String text) {
      if (text == null || text.isEmpty) {
        return "";
      }

      List<String> words = text.split(' ');
      List<String> titleCaseWords = [];

      for (String word in words) {
        if (word.isNotEmpty) {
          titleCaseWords.add(word[0].toUpperCase() + word.substring(1).toLowerCase());
        }
      }

      return titleCaseWords.join(' ');
    }
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        UserController userController = Get.find<UserController>();
        return <Widget>[
          SliverOverlapAbsorber(
            handle:
            NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              leading: SizedBox(width: 0,),
              leadingWidth: 0,
              backgroundColor: isDark? Color(0xff2C2E3B) : Colors.white,
              title: RichText(
                text: TextSpan(
                  text: 'Hello, \n',
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: <TextSpan>[
                    TextSpan(text: toTitleCase('${userController.myUser.name}'),
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 22)),
                  ]
                ),
              ),
              actions: [
                GetBuilder<ThemeManager>(
                  builder: (_) => CupertinoSwitch(
                    trackColor: Color(0xffB0CBB0),
                    activeColor: Colors.black,
                    value: tManager.isDark,
                    onChanged: (newValue){
                      tManager.toggleTheme(newValue);
                    },
                  ),
                ),

              ],
              pinned: true,
              expandedHeight: 150.0,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Get.theme.primaryColorDark,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Get.theme.primaryColorDark,
                labelStyle: GoogleFonts.bebasNeue(
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      _tabOptions[0][0],
                    ),
                  ),
                  Tab(
                    child: Text(
                      _tabOptions[1][0],
                    ),
                  ),
                  Tab(
                    child: Text(
                      _tabOptions[2][0],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
          children: tabs
      ),
    );
  }
}
