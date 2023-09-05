import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/components/slider.dart';
import 'package:wild_sport/components/topStories.dart';
import '../components/newsBlock.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List _slides = [
    ['assets/images/football1.jpg', 'This is just some sample title'],
    ['assets/images/football2.jpg', 'This is just some sample title'],
    ['assets/images/football3.jpg', 'This is just some sample title'],
    ['assets/images/football4.jpg', 'This is just some sample title'],
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:         Container(
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
                        onPressed: (){},
                        child: Text('View more', style: Theme.of(context).textTheme.labelMedium,),
                      ),
                    ),
                  ],
                ),
                CarouselSlider.builder(
                    itemCount: _slides.length,
                    itemBuilder: (context, index, realIndex) {
                      final aSlide = _slides[index];
                      return NewsBlock(
                        image: aSlide[0],
                        title: aSlide[1],
                        subtitle: "Sharon fix this",
                      );
                      //return buildImage(aImage, index);
                    },
                    options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: false,
                        //enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) => {
                          activeIndex = index,
                        }
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5).withOpacity(0.5),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  ),
                  child: Column(
                    children: [
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
                                onPressed: (){},
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
        )
      ],
    );
  }
}
