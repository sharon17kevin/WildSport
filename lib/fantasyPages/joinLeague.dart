import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';

class JoinLeague extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  UserController userController = Get.find<UserController>();
  var found = false.obs;
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
        title: Text('Join League'),
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
                Text('Entry Code'),
                MyTextField(
                    controller: controller,
                    hintText: 'Enter League Code Here',
                    obscureText: false
                ),
                SizedBox(height: 25,),
                Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  child: InkWell(
                    onTap: () async {
                      await userController.getSingleLeague(controller.text);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text('Search',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Get.isDarkMode? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Text('League Found'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode? Colors.white : Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(
                      ()=>Text('${userController.leagueUpdating.value.name}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Get.isDarkMode? Colors.black : Colors.white,
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Obx(
                  ()=> Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: (userController.leagueUpdating.value.name != 'None' && !userController.myUser.leagues!.contains(userController.leagueUpdating.value.id))? Get.isDarkMode? Colors.white : Colors.black : Colors.grey
                    ),
                    child: Obx(
                      ()=> InkWell(
                        onTap: (userController.leagueUpdating.value.name == 'None' && userController.myUser.leagues!.contains(userController.leagueUpdating.value.id))?() {}:
                        () {
                          userController.joinLeague(userController.leagueUpdating.value).then((value) async {
                            await userController.fetchLeagues(userController.myUser);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text('Join League',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Get.isDarkMode? Colors.black : Colors.white,
                            ),
                          ),
                        ),
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
