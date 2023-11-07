import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/leagueModel.dart';

class CreateLeague extends StatelessWidget {
  UserController userController = Get.find<UserController>();
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String uniqueID = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    uniqueID += uuid.v1().substring(0, 4);

    void showDialog(String title, String name, String code) {
      Get.defaultDialog(
        title: title,
        content: Column(
          children: [
            Text('League: $name'),
            Text('Entry Code: $code')
          ],
        ),
        actions: [
          Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Get.isDarkMode? Colors.white : Colors.black
            ),
            child: InkWell(
              onTap: () async{
                await userController.postNewLeague(controller.text, uniqueID);
                await userController.fetchLeagues(userController.myUser).then((value) {
                  Get.back();
                  Get.back();
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Proceed',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Get.isDarkMode? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
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
        title: Text('Create League'),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text('Private League',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25,),
                Text('League Name'),
                MyTextField(
                    controller: controller,
                    hintText: 'Enter League Name',
                    obscureText: false
                ),
                SizedBox(height: 25,),
                Text('Unique Code'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode? Colors.white : Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(uniqueID,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Get.isDarkMode? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  child: InkWell(
                    onTap: () async{
                      if(controller.text == '') {

                      } else {
                        showDialog('League Info', controller.text, uniqueID);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text('Create',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Get.isDarkMode? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
