import 'package:flutter/material.dart';

import '../components/playerCard.dart';

class Transfers1 extends StatefulWidget {
  @override
  _Transfers1State createState() => _Transfers1State();
}

class _Transfers1State extends State<Transfers1> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scaleFactor = 0.6;
      Navigator.of(context).pop();
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: closeDrawer,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen? 20 : 0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isDrawerOpen? 20 : 0),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: isDark? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text('Back',
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            ),
                          ),
                          Text('Pick Your Team',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: isDark? Colors.white : Color(0xff4A4138),
                              fontSize: 23,
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text('Save',
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage(
                            isDark? 'assets/images/fieldDark.png' : 'assets/images/fieldLight.png',
                          ),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: RefreshIndicator(
                      onRefresh: (){
                        return Future.delayed(Duration(seconds: 0));
                      },
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlayerCard(onClicked: openDrawer,),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.yellow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,)
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            //color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                                PlayerCard(onClicked: openDrawer,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
