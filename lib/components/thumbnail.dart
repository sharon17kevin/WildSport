import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/home_pages/videoPage.dart';
import 'package:wild_sport/models/highlightsModel.dart';

class Thumbnail extends StatefulWidget {
  final Highlight highlight;

  Thumbnail({required this.highlight});
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
          Get.to(() => VideoMediaPlayer(
            highlight: widget.highlight,
          ));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
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
                    Text("Wildcard Video",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.withOpacity(0.6)
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(widget.highlight.title, maxLines: 2, overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(
                        widget.highlight.thumbUrl,
                        fit: BoxFit.cover,
                        color: Colors.green,
                        colorBlendMode: BlendMode.softLight,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                            return Container(
                              height: 60,
                              width: 100,
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/imagePlaceholder.webp',
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            );
                          } else {
                            return Container(height: 60, child: Center(child: CircularProgressIndicator()));
                          }
                        },
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Container(
                            height: 60,
                            width: 100,
                            child: Center(
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
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.play_arrow, size: 18,)
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
