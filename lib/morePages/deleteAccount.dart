import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/models/userModel.dart' as MainUser;
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/models/userModel.dart';
import 'package:wild_sport/screens/forgotPassword.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/login.dart';
import 'package:wild_sport/screens/signUp.dart';

class DeleteAccount extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
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
        title: Text('Delete Account'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Image.asset(
                    'assets/images/lotus_ball.png',
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 50,),
                  Obx(
                          ()=> Text(
                        userController.error.value,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                        ),
                      )
                  ),
                  SizedBox(height: 5,),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  SizedBox(height: 15,),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 25,),
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff7B8186)
                    ),
                    child: InkWell(
                      onTap: () async{
                        if (userController.myUser.email == emailController.text){
                          userController.deleteMeCont(userController.myUser, passwordController.text).then((value) => Get.to(()=> Login()));
                          await SecureStorage.writeSecureData('password', '');
                          await SecureStorage.writeSecureData('token', '');
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text('Delete Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}