import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/components/newsBlock.dart';

late var activeIndex;

Widget MySlider (List slides) {
  return Container(
    child: CarouselSlider.builder(
        itemCount: slides.length,
        itemBuilder: (context, index, realIndex) {
          final aSlide = slides[index];
          return NewsBlock(
            image: aSlide[0],
            title: aSlide[1],
            subtitle: "Sharon fix this",
            timeStamp: aSlide,
          );
          //return buildImage(aImage, index);
        },
        options: CarouselOptions(
            height: 400,
            //viewportFraction: 0.5,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) => {
              activeIndex = index,
            }
        )
    ),
  );
}