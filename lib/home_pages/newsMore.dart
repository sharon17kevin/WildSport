import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsMore extends StatefulWidget {
  @override
  _NewsMoreState createState() => _NewsMoreState();
}

class _NewsMoreState extends State<NewsMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More News'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              child: Column(
                children: [
                  Text("News"),
                  Divider(
                    thickness: 2,
                    color: Get.theme.primaryColorDark,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
