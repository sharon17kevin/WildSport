import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helperPages/statsTile.dart';
import '../stat_pages/season_stats.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
                        backgroundColor: Color(0xff4A4138),
                        radius: 25,
                        child: Icon(Icons.person),
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
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: StatsTile(
              page: SeasonStats(),
              title: "Management Panel",
            ),
          ),
        ),
      ],
    );
  }
}

