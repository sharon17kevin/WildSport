import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/morePages/bookmark.dart';
import 'package:wild_sport/morePages/faqs.dart';
import 'package:wild_sport/morePages/legal.dart';
import 'package:wild_sport/morePages/manageAccount.dart';
import 'package:wild_sport/morePages/managementPanel.dart';
import 'package:wild_sport/morePages/overview.dart';
import 'package:wild_sport/morePages/whatDoWeDo.dart';
import 'package:wild_sport/screens/login.dart';

import '../helperPages/statsTile.dart';
import '../stat_pages/season_stats.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  UserController userController = Get.find<UserController>();
   void checkIfAdmin() async{
    final String authToken = await SecureStorage.readSecureData('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(authToken);
    bool subject = decodedToken['admin'];
    admin.value = subject;
  }
  RxBool admin = true.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfAdmin();
  }

  void removeUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('wildcard_user_id');
  }

  void showSignOut() {
    Get.dialog(
        AlertDialog(
          title: Text('Sign Out'),
          content: Text('Confirm Sign Out'),
          actions: <Widget>[
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text('Cancel',
                  style: TextStyle(
                    fontSize: 15,
                    color: Get.isDarkMode? Colors.white : Colors.black,
                    letterSpacing: 1,
                  ),
                )
            ),
            TextButton(
                onPressed: () async{
                  await SecureStorage.writeSecureData('password', '');
                  await SecureStorage.writeSecureData('token', '');
                  removeUserID();
                  Get.to(()=> Login());
                },
                child: Text('Confirm',
                  style: TextStyle(
                    fontSize: 15,
                    color: Get.isDarkMode? Colors.white : Colors.black,
                    letterSpacing: 1,
                  ),
                )
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 0,
          leading: SizedBox(width: 0,),
          backgroundColor: isDark? Color(0xff3D4455) : Colors.white,
          pinned: true,
          collapsedHeight: 200,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
            centerTitle: true,
            title: Container(
              height: 130,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffCCB28F),
                    radius: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 29,
                      child: CircleAvatar(
                        backgroundColor: Get.isDarkMode? Colors.white : Colors.black,
                        radius: 25,
                        child: Icon(Icons.person,
                          color: Get.isDarkMode? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text('My Account', style: Theme.of(context).textTheme.labelMedium),
                  ),
                ],
              ),
            ),
          ),
          shape: Border(
            bottom: BorderSide(color: isDark? Colors.white : Color(0xffCCB28F), width: 1)
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 30,),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Get.isDarkMode? Colors.white: Colors.black,
                            width: 1
                        )
                    )
                ),
                child: Text(
                    'Personal'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Get.isDarkMode? Colors.white : Colors.black
                ),
                child: InkWell(
                  onTap: () {
                    showSignOut();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Sign Out',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Get.isDarkMode? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: ManageAccount(),
                  title: "Manage Account",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: Bookmark(),
                  title: "Bookmarks",
                ),
              ),
              Container(
                width: Get.width,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Get.isDarkMode? Colors.white: Colors.black,
                      width: 1
                    )
                  )
                ),
                child: Text(
                  'About'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: Overview(),
                  title: "Overview",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: WhatDoWeDo(),
                  title: "What do we do?",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: Legal(),
                  title: "Legal",
                ),
              ),
              Container(
                width: Get.width,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Get.isDarkMode? Colors.white: Colors.black,
                            width: 1
                        )
                    )
                ),
                child: Text(
                    'Other'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: ManagementPanel(),
                  title: "Contact Us",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: FAQs(),
                  title: "FAQs",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: ManagementPanel(),
                  title: "Terms and Conditions",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatsTile(
                  page: ManagementPanel(),
                  title: "Cookie Policies",
                ),
              ),
              Obx(
                ()=> Visibility(
                  visible: admin.isTrue,
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Get.isDarkMode? Colors.white: Colors.black,
                                    width: 1
                                )
                            )
                        ),
                        child: Text(
                            'Admin Only'
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: StatsTile(
                          page: ManagementPanel(),
                          title: "Management Panel",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

