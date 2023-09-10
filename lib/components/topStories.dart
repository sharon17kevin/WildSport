import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/topBlock.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';

dynamic divider = Color(0xffCCB28F);

Widget TopStories(BuildContext context) {
  final BreakingNewsController _breakingNewsController = Get.find<BreakingNewsController>();
  List<BreakingNews> slides = _breakingNewsController.myLatestNews;
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Divider(
          height: 5,
          thickness: 1,
          color: isDark? Colors.white : divider,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  slides[0].imageUrl,
                  color: Colors.green,
                  colorBlendMode: BlendMode.softLight,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 200,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                      return Center(
                        child: Image.asset(
                          'assets/icons/imagePlaceholder.webp',
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Center(
                      child: Image.asset(
                        'assets/icons/imagePlaceholder.webp',
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Text(slides[0].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_police),
                              Text('  Wildcard . 5 mins', style: Theme.of(context).textTheme.labelSmall,),
                            ],
                          ),
                          Icon(Icons.bookmark_border)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        TopBlock(
          url: slides[1].imageUrl,
          title: slides[1].title,
          subtitle: slides[1].subtitle,
        ),
        TopBlock(
          url: slides[2].imageUrl,
          title: slides[2].title,
          subtitle: slides[2].subtitle,
        ),
        TopBlock(
          url: slides[3].imageUrl,
          title: slides[3].title,
          subtitle: slides[3].subtitle,
        ),
        TopBlock(
          url: slides[4].imageUrl,
          title: slides[4].title,
          subtitle: slides[4].subtitle,
        ),

        // TopBlock(context),
        // TopBlock(context),
        // TopBlock(context),
        // TopBlock(context),
        // Divider(
        //   height: 20,
        //   thickness: 2,
        //   color: divider,
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       Container(
        //           child: Padding(
        //             padding: EdgeInsets.all(10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               children: [
        //                 Row(
        //                   children: [
        //                     SizedBox(
        //                       width: 180,
        //                     ),
        //                     Text('Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, ',
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: Theme.of(context).textTheme.bodyLarge,
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   children: [
        //                     Icon(Icons.local_police),
        //                     Text('  Wildcard . 5 mins'),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )
        //       ),
        //       Positioned(
        //         top: -15,
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(10),
        //           child: Image.asset(
        //             'assets/images/football1.jpg',
        //             fit: BoxFit.cover,
        //             width: 150,
        //             height: 100,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        //
        // //-------------------------------Third block-------------------------->
        // Divider(
        //   height: 20,
        //   thickness: 2,
        //   color: divider,
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       Container(
        //           child: Padding(
        //             padding: EdgeInsets.all(10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               children: [
        //                 Row(
        //                   children: [
        //                     SizedBox(
        //                       width: 180,
        //                     ),
        //                     Text('Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, ',
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: Theme.of(context).textTheme.bodyLarge,
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   children: [
        //                     Icon(Icons.local_police),
        //                     Text('  Wildcard . 5 mins'),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )
        //       ),
        //       Positioned(
        //         top: -15,
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(10),
        //           child: Image.asset(
        //             'assets/images/football1.jpg',
        //             fit: BoxFit.cover,
        //             width: 150,
        //             height: 100,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // //--------------------------Fourth------------------------------------>
        // Divider(
        //   height: 20,
        //   thickness: 2,
        //   color: divider,
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       Container(
        //           child: Padding(
        //             padding: EdgeInsets.all(10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               children: [
        //                 Row(
        //                   children: [
        //                     SizedBox(
        //                       width: 180,
        //                     ),
        //                     Text('Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, ',
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: Theme.of(context).textTheme.bodyLarge,
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   children: [
        //                     Icon(Icons.local_police),
        //                     Text('  Wildcard . 5 mins'),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )
        //       ),
        //       Positioned(
        //         top: -15,
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(10),
        //           child: Image.asset(
        //             'assets/images/football1.jpg',
        //             fit: BoxFit.cover,
        //             width: 150,
        //             height: 100,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
}