import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/models/leagueModel.dart';

class LeaguePage extends StatelessWidget {
  final League league;

  LeaguePage({required this.league});
  @override
  Widget build(BuildContext context) {
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
        title: Text('Player Comparison'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 25,
                width: double.maxFinite,
                color: Colors.cyanAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pos',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    Text('Team Name',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    Text('Points',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return LeagueTile(
                      index: index,
                      title: 'Default',
                      points: 100,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LeagueTile extends StatelessWidget {
  final int index;
  final String title;
  final int points;

  LeagueTile({required this.index, required this.title, required this.points});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600
        ),
      ),
      title: Center(child: Text('$title',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600
        ),
      )),
      trailing: Text('$points',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

