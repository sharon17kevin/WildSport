import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBlock extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;

  TopBlock({required this.url, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    dynamic divider = Color(0xffCCB28F);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
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
                                Icon(Icons.local_police),
                                Text('  Wildcard . 5 mins',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                            Icon(Icons.bookmark_border)
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
    );
  }
}