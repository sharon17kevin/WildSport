import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/thumbnail.dart';
import 'package:wild_sport/controllers/highlightsController.dart';
import 'package:wild_sport/models/highlightsModel.dart';
import 'package:wild_sport/components/thumbnail.dart' as Thumbnail1;

class VideoMore extends StatefulWidget {
  @override
  _VideoMoreState createState() => _VideoMoreState();
}

class _VideoMoreState extends State<VideoMore> {
  HighlightsController highlightsController = Get.find<HighlightsController>();
  @override
  Widget build(BuildContext context) {
    List<Highlight> highlights = highlightsController.myHighlights;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('More Videos'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              //height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Videos"),
                  Divider(
                    thickness: 2,
                    color: Get.theme.primaryColorDark,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: highlights.length,
                      itemBuilder: (context, index) {
                        return Thumbnail1.Thumbnail(
                            highlight: highlights[index]
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
