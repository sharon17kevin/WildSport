import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/components/thumbnail.dart';
import 'package:wild_sport/helpers/shorts.dart';
import 'package:get/get.dart';
import 'package:wild_sport/home_pages/newsMore.dart';

class Highlights extends StatelessWidget {

  List _slides = [
    ['assets/images/football1.jpg', 'This is just some sample title'],
    ['assets/images/football2.jpg', 'This is just some sample title'],
    ['assets/images/football3.jpg', 'This is just some sample title'],
    ['assets/images/football4.jpg', 'This is just some sample title'],
  ];
  var activeIndex;

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
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
                          Get.to(() => NewsMore());
                        },
                      ),
                    ],
                  ),
                ),
              ),
                SliverList(
                    delegate: SliverChildListDelegate(
                     [
                       Thumbnail(),
                       Thumbnail(),
                       Thumbnail(),
                       Thumbnail(),
                       Thumbnail(),
                       Thumbnail(),
                     ]
                    ),
                ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border(
                        top: BorderSide(
                          color: isDark? Colors.white30 : Color(0xffCCB28F),
                          width: 1
                        ),
                        bottom: BorderSide(
                          color: isDark? Colors.white30 : Color(0xffCCB28F),
                          width: 1
                        ),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            'Shorts',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      CarouselSlider.builder(
                          itemCount: _slides.length,
                          itemBuilder: (context, index, realIndex) {
                            final aSlide = _slides[index];
                            return Shorts(
                              image: aSlide[0],
                              title: aSlide[1],
                            );
                          },
                          options: CarouselOptions(
                            viewportFraction: 0.5,
                            aspectRatio: 1/2,
                            pageSnapping: false,
                            enableInfiniteScroll: false,
                              height: 250,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) => {
                                activeIndex = index,
                              }
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
