import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/userModel.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/login.dart';

import '../functions/secureStorage.dart';

class SignUp extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
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
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  SizedBox(height: 15,),
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () async {
                      User newUser = User(
                        name: usernameController.text,
                        email: emailController.text,
                      );
                      await SecureStorage.writeSecureData('password', passwordController.text);
                      await userController.signUp(newUser);
                      Get.to(() => HomeScreenN());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color(0xff7B8186),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
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
                              'Already have an account?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => Login());
                              },
                              child: Text('Sign in',
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