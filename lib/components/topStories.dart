import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wild_sport/components/topBlock.dart';

dynamic divider = Color(0xffCCB28F);

Widget TopStories(BuildContext context) {
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
                child: Image.asset(
                  'assets/images/football1.jpg',
                  color: Colors.green,
                  colorBlendMode: BlendMode.softLight,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 200,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Text('Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, ',
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
        TopBlock(context),
        TopBlock(context),
        TopBlock(context),
        TopBlock(context),

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