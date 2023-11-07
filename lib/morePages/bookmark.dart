import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/topBlock.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';

class Bookmark extends StatelessWidget {
  BreakingNewsController _breakingNewsController = Get.find<BreakingNewsController>();
  @override
  Widget build(BuildContext context) {
    List<BreakingNews> dummyNews = _breakingNewsController.myLatestNews;
    List<BreakingNews> news = dummyNews.where((element) => element.bookmark == true).toList();
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
        title: Text('Manage Accounts'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              //height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("News"),
                  Divider(
                    thickness: 2,
                    color: Get.theme.primaryColorDark,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: news.length > 0?
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return TopBlock(
                          url: news[index].imageUrl,
                          title: news[index].title,
                          subtitle: news[index].subtitle,
                          timeStamp: news[index].timestamp,
                          news: news[index],
                        );
                      },
                    ):
                    Container(
                      width: double.maxFinite,
                      height: 300,
                      alignment: Alignment.center,
                      child: Text('No bookmarked news yet'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
