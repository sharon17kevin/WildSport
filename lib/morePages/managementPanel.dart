import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/managementController.dart';
import 'package:wild_sport/morePages/matchManagement.dart';
import 'package:wild_sport/morePages/matchManagement2.dart';
import 'package:wild_sport/morePages/newsManagement.dart';
import 'package:wild_sport/morePages/teamRegistration.dart';
import 'package:wild_sport/morePages/updates.dart';
import 'package:wild_sport/morePages/videoManagement.dart';

class ManagementPanel extends StatefulWidget {
  @override
  _ManagementPanelState createState() => _ManagementPanelState();
}

class _ManagementPanelState extends State<ManagementPanel> {
  ManagementController managementController = Get.put(ManagementController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: (){
                Get.back();
                managementController.dispose();
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 10,),
                    SizedBox(width: 5,),
                    Text('Back')
                  ],
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text('Manage Data'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Video',),
              Tab(text: 'News',),
              Tab(text: 'Match',),
              Tab(text: 'Update',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: VideoManagement()),
            Center(child: NewsManagement()),
            Center(child: MatchManagement1()),
            Center(child: Updates()),
          ],
        ),
      ),
    );
  }
}
