import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image = Get.arguments[0];
    String title = Get.arguments[1];
    String subtitle = Get.arguments[2];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 15,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 10,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                  width: double.maxFinite,
                  child: Center(child: Text(
                    title,
                      //'The News Title',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ))
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                image,
                //'assets/images/football3.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
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
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                //subtitle,
                lorem(paragraphs: 4, words: 500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
