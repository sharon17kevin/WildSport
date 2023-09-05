import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/screens/homescreen.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/loading.dart';
import 'package:wild_sport/screens/login.dart';
import 'package:wild_sport/screens/signUp.dart';
import 'package:wild_sport/themes/theme_constants.dart';
import 'package:wild_sport/themes/theme_manager.dart';

ThemeManager themeManager = ThemeManager();

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if(mounted) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        //home: Login(),
        //home: SignUp(),
        //home: Loading(),
        home: HomeScreenN(),
    );
    //   MaterialApp(
    //   theme: lightTheme,
    //   darkTheme: darkTheme,
    //   themeMode: themeManager.themeMode,
    //   home: HomeScreenN(),
    // );
  }
}