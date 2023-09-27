import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:wild_sport/helperPages/newsPage.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';

class TopBlock extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final DateTime timeStamp;
  final BreakingNews news;

  TopBlock({required this.url, required this.title, required this.subtitle, required this.timeStamp, required this.news});

  String timeAgo(timestamp) {
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
    dynamic divider = Color(0xffCCB28F);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var isFirstBookmark = news.bookmark.obs;
    final BreakingNewsController _breakingNewsController = Get.find<BreakingNewsController>();
    return GestureDetector(
      onTap: (){
        Get.to(
            NewsPage(),
            arguments: [
              url,
              title,
              subtitle
            ]
        );
      },
      child: Column(
        children: [
          Divider(
            height: 20,
            thickness: 1,
            color: isDark? Colors.white : divider,
          ),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            url,
                            color: Colors.green,
                            colorBlendMode: BlendMode.softLight,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 100,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    //padding: EdgeInsets.only(right: 2),
                    width: 200,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('  Wildcard . ',
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  Text(timeAgo(timeStamp),
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              ),
                              Obx(
                                    ()=> IconButton(
                                  onPressed: (){
                                    isFirstBookmark.value = !isFirstBookmark.value;
                                    news.bookmark = isFirstBookmark.value;
                                    _breakingNewsController.putUpdateBookmark(news.bookmark, [news.id]);
                                    //update the newsBlock
                                  },
                                    icon: isFirstBookmark.value? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}