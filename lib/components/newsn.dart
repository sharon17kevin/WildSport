import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/slider.dart';
import 'package:wild_sport/components/topStories.dart';
import 'package:wild_sport/controllers/highlightsController.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/controllers/shortsController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/home_pages/newsMore.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';
import '../components/newsBlock.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';

List _slides = [
  ['assets/images/football1.jpg', 'This is just some sample title'],
  ['assets/images/football2.jpg', 'This is just some sample title'],
  ['assets/images/football3.jpg', 'This is just some sample title'],
  ['assets/images/football4.jpg', 'This is just some sample title'],
];

class NewsN extends StatefulWidget {
  @override
  _NewsNState createState() => _NewsNState();
}

class _NewsNState extends State<NewsN> {

  final BreakingNewsController _breakingNewsController = Get.put(BreakingNewsController());
  final MatchesController _matchesController = Get.put(MatchesController());
  final HighlightsController _highlightsController = Get.put(HighlightsController());
  final ShortsController _shortsController = Get.put(ShortsController());
  final TeamController _teamController = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _breakingNewsController.myBreakingNews.isNotEmpty? SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (BuildContext context) {
            bool isDark = Theme.of(context).brightness == Brightness.dark;
            return CustomScrollView(
              key: PageStorageKey<String>('Name'),
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Text('Breaking News', style: Theme.of(context).textTheme.labelLarge,),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: TextButton(
                                  onPressed: (){
                                    Get.to(() => NewsMore());
                                  },
                                  child: Text('View more', style: Theme.of(context).textTheme.labelMedium,),
                                ),
                              ),
                            ],
                          ),
                          Obx(
                          () => CarouselSlider.builder(
                                itemCount: _breakingNewsController.myBreakingNews.length,
                                itemBuilder: (context, index, realIndex) {
                                  final slide = _breakingNewsController.myBreakingNews[index];
                                  return NewsBlock(
                                    image: slide.imageUrl,
                                    title: slide.title,
                                    subtitle: slide.subtitle,
                                  );
                                },
                                options: CarouselOptions(
                                    height: 300,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 2),
                                    enlargeCenterPage: false,
                                    onPageChanged: (index, reason) => {
                                      activeIndex = index,
                                    }
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: isDark? Colors.white : Color(0xffCCB28F), width: 1
                              ),
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 8,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: isDark? Colors.white : Color(0xffCCB28F),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Text('Newest', style: Theme.of(context).textTheme.labelLarge,)
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: TextButton(
                                          onPressed: (){
                                            Get.to(() => NewsMore());
                                          },
                                          child: Text('View more', style: Theme.of(context).textTheme.labelMedium,),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                TopStories(context),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ): Center(
        child: CircularProgressIndicator(),
      ),
    )
    ;
  }
}