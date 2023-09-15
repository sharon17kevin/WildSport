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
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Get.back();
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
