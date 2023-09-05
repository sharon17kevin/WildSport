import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/helpers/drawerCard.dart';

class PlayerCard extends StatefulWidget {
  final VoidCallback onClicked;

  const PlayerCard({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15)
              )
            ),
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      color: isDark? Colors.white : Color(0xffCCB28F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                child: Text('Substitute'),
                                onPressed: widget.onClicked,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                child: Text('Full Profile'),
                                onPressed: (){},
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: CheckboxListTile(
                                title: Text('Captain'),
                                value: _checked,
                                onChanged: (value) {
                                  setState((){
                                    _checked = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: CheckboxListTile(
                                title: Text('Captain'),
                                value: _checked,
                                onChanged: (value) {
                                  setState((){
                                    _checked = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 7,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/player.png',
                    ),
                    fit: BoxFit.contain,
                    alignment: Alignment.center
                  )
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                width: double.maxFinite,
                color: Color(0xff2F5233),
                child: Text('SomeText',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff94C973),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 2),
                width: double.maxFinite,
                child: Text('SomeText',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
