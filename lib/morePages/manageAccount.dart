import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';

class ManageAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final UserController userController = Get.find<UserController>();
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
        title: Text('Manage Accounts'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text('Team Name'),
              MyTextField(
                  controller: nameController,
                  hintText: '${userController.myUser.teamName}',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Text('Team Color Code'),
              MyTextField(
                  controller: emailController,
                  hintText: '${userController.myUser.email}',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Get.isDarkMode? Colors.white : Colors.black
                ),
                child: InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Save',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Get.isDarkMode? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text('Delete Account',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 25,),
              Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Get.isDarkMode? Colors.white : Colors.black
                ),
                child: InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Delete My Account',
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
    );
  }
}
