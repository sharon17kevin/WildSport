import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wild_sport/helpers/teamStatsBlocks.dart';

class TeamStats extends StatefulWidget {
  @override
  State<TeamStats> createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {
  var _slides = [
    ["Most Goals For", Icon(Icons.local_activity_rounded), "13"],
    ["Most Goals For", Icon(Icons.local_activity_rounded), "13"],
    ["Most Goals For", Icon(Icons.local_activity_rounded), "13"],
    ["Most Goals For", Icon(Icons.local_activity_rounded), "13"],
    ["Most Goals For", Icon(Icons.local_activity_rounded), "13"],
  ];

  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:           Column(
        children: [
          CarouselSlider.builder(
              itemCount: _slides.length,
              itemBuilder: (context, index, realIndex) {
                final aSlide = _slides[index];
                return TeamStatsBlocks(
                  category: aSlide[0],
                  team: aSlide[1],
                  stat: aSlide[2],
                );
              },
              options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  onPageChanged: (index, reason) => {
                    setState(() => activeIndex = index)
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: _slides.length,
              effect:  ScrollingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.black54,
                dotColor: Colors.black26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
