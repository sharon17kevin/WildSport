import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/home_pages/videoPage.dart';

class Thumbnail extends StatefulWidget {
  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(() => VideoMediaPlayer());
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                    color: isDark? Colors.white30 : Colors.black38,
                    width: 1
                  )
              )
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sample Theme"),
                    SizedBox(height: 15),
                    Text("Title Title Title Title", overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/football1.jpg',
                        fit: BoxFit.cover,
                        color: Colors.green,
                        colorBlendMode: BlendMode.softLight,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.play_arrow, size: 18,),
                          Icon(Icons.bookmark_border, size: 18,)
                        ],
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
