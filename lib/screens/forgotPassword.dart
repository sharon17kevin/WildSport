import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/userModel.dart' as MainUser;
import 'package:wild_sport/screens/emailRecovery.dart';

class ForgotPassword extends StatelessWidget {
  final String email;

  ForgotPassword({required this.email});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final UserController userController = Get.find<UserController>();
    void sendPasswordResetEmail(String email) async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      } catch (e) {
        throw Exception(e);
      }
    }
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
        title: Text('Enter Registered Email'),
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
                    hintText: email,
                    obscureText: false,
                  ),

                  SizedBox(height: 15,),
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff7B8186)
                    ),
                    child: InkWell(
                      onTap: () async{
                        //sendPasswordResetEmail(emailController.text);
                        Get.to(()=> EmailRecovery());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text('Send Reset Email',
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
