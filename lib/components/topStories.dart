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
  var isFirstBookmark = slides[0].bookmark.obs;

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
                      return Center(child: Container(
                          height: 150,
                          alignment: Alignment.center,
                          child: Container(height: 50, width: 50, child: CircularProgressIndicator())
                      ));
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Center(
                      child: Container(
                        height: 150,
                        child: Image.asset(
                          'assets/icons/imagePlaceholder.webp',
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Text(slides[0].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('  Wildcard . ', style: Theme.of(context).textTheme.labelSmall,),
                              Text( timeAgo(slides[0].timestamp), style: Theme.of(context).textTheme.labelSmall,)
                            ],
                          ),
                          Obx(
                            ()=> IconButton(
                              onPressed: (){
                                isFirstBookmark.value = !isFirstBookmark.value;
                                slides[0].bookmark = isFirstBookmark.value;
                                _breakingNewsController.putUpdateBookmark(slides[0].bookmark, [slides[0].id]);
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
              )
            ],
          ),
        ),
        TopBlock(
          url: slides[1].imageUrl,
          title: slides[1].title,
          subtitle: slides[1].subtitle,
          timeStamp: slides[1].timestamp,
          news: slides[1],
        ),
        TopBlock(
          url: slides[2].imageUrl,
          title: slides[2].title,
          subtitle: slides[2].subtitle,
          timeStamp: slides[2].timestamp,
          news: slides[2],
        ),
        TopBlock(
          url: slides[3].imageUrl,
          title: slides[3].title,
          subtitle: slides[3].subtitle,
          timeStamp: slides[3].timestamp,
          news: slides[3],
        ),
        TopBlock(
          url: slides[4].imageUrl,
          title: slides[4].title,
          subtitle: slides[4].subtitle,
          timeStamp: slides[4].timestamp,
          news: slides[4],
        ),
      ],
    ),
  );
}