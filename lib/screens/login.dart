import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/userModel.dart' as MainUser;
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/models/userModel.dart';
import 'package:wild_sport/screens/forgotPassword.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/signUp.dart';

class Login extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.find<UserController>();
  // final UserController userController = Get.put(UserController());
  // final TeamController teamController = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    void saveName(String name) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('wildcard_user_id', name);
    }
    var error = ''.obs;
    void sendPasswordResetEmail(String email) async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      } catch (e) {
        throw Exception(e);
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          onTap: (){
                            Get.to(()=>ForgotPassword(email: emailController.text,));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff7B8186)
                    ),
                    child: InkWell(
                      onTap: () async{
                        MainUser.User newUser = MainUser.User(
                          email: emailController.text.toLowerCase(),
                        );
                        await SecureStorage.writeSecureData('password', passwordController.text);
                        passwordController.text = '';
                        userController.login(newUser).then((value) {
                            saveName(userController.myUser.id!);
                            Get.to(()=> HomeScreenN());
                          }
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text('Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account yet?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SignUp());
                              },
                              child: Text('Register',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
