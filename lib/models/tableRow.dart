import 'package:flutter/material.dart';

class Drow extends StatefulWidget {
  final double height;

  const Drow({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  _DrowState createState() => _DrowState();
}

class _DrowState extends State<Drow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.orange,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.orange,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.purple,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
    );
  }
}
