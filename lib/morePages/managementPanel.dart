import 'package:flutter/material.dart';
import 'package:wild_sport/morePages/matchManagement.dart';
import 'package:wild_sport/morePages/newsManagement.dart';
import 'package:wild_sport/morePages/teamRegistration.dart';

class ManagementPanel extends StatefulWidget {
  @override
  _ManagementPanelState createState() => _ManagementPanelState();
}

class _ManagementPanelState extends State<ManagementPanel> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Data'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Team Registration',),
              Tab(text: 'News',),
              Tab(text: 'Match',),
              Tab(text: 'Update',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: TeamRegistration()),
            Center(child: NewsManagement()),
            Center(child: MatchManagement()),
            Center(child: Text('This is Tab 4')),
          ],
        ),
      ),
    );
  }
}
