import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic divider = Color(0xffCCB28F);

Widget TopBlock(BuildContext context) {
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
                  child: Image.asset(
                    'assets/images/football1.jpg',
                    color: Colors.green,
                    colorBlendMode: BlendMode.softLight,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
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
                      child: Text('Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, ',
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