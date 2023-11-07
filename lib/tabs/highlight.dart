import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/controllers/highlightsController.dart';
import 'package:wild_sport/helpers/shorts.dart';
import 'package:get/get.dart';
import 'package:wild_sport/home_pages/videoMore.dart';
import 'package:wild_sport/models/highlightsModel.dart';
import 'package:wild_sport/components/thumbnail.dart' as Thumbnail1;

class Highlights extends StatelessWidget {
  var activeIndex;
  HighlightsController highlightsController = Get.find<HighlightsController>();
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    List<Highlight> highlights = highlightsController.myHighlights;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 120),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("View More",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        onPressed: (){
                          Get.to(() => VideoMore());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Thumbnail1.Thumbnail(highlight: highlights[index],);
                  },
                  childCount: highlights.sublist(0,4).length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
