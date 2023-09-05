import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                  width: double.maxFinite,
                  child: Center(child: Text(
                      'The News Title',
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
              background: Image.asset(
                  'assets/images/football3.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                lorem(paragraphs: 4, words: 500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
