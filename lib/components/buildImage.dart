import 'package:flutter/material.dart';

Widget BuildImage(context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/images/football2.jpg',
            fit: BoxFit.cover,
            color: Colors.green,
            colorBlendMode: BlendMode.softLight,
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).primaryColor,
          child: Text('10:25'),
        ),
      ),
      CircleAvatar(
        radius: 24,
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_right_outlined, size: 48,),
      ),
    ],
  );
}