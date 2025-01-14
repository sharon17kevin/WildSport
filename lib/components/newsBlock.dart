import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/helperPages/newsPage.dart';

class NewsBlock extends StatelessWidget {
  dynamic image;
  dynamic title;
  String subtitle;
  final DateTime timeStamp;
  NewsBlock({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.timeStamp
  }) : super(key: key);

  String timeAgo(timeStamp) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(timeStamp);
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;

    String timeAgo;
    if (days > 0) {
      timeAgo = '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (hours > 0) {
      timeAgo = '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else {
      timeAgo = '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    }

    return timeAgo;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
      return GestureDetector(
        onTap: (){
          Get.to(
            NewsPage(),
            arguments: [
              image,
              title,
              subtitle
            ]
          );
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsPage()));
        },
        child: Container(
          width: 325,
        margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: isDark? Colors.white : Color(0xffCCB28F), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(2,5)
            )
          ],
          color: isDark? Color(0xff2C2E3B) : Color(0xff4A4138),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        color: Colors.green,
                        colorBlendMode: BlendMode.softLight,
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
                  ),
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ]
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(' Wildcard . ', style: Theme.of(context).textTheme.bodySmall),
                              Text(timeAgo(timeStamp), style: Theme.of(context).textTheme.bodySmall)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                child: Column(
                  children: [
                    Text(title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                    Text(subtitle,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
  ),
      );
  }
}
