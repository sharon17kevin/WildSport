import 'package:flutter/material.dart';
import 'package:wild_sport/models/tableRow.dart';

class LeagueTable extends StatefulWidget {
  @override
  _LeagueTableState createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text('Back',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Center(
            child: Text('Table')
        ),
        actions: [
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Drow(
                height: 25,
              ),
              Drow(
                height: 40,
              ),
              Drow(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
