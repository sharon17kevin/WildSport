import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/userModel.dart';
import 'package:wild_sport/screens/homescreen1.dart';
import 'package:wild_sport/screens/login.dart';
import 'package:wild_sport/screens/onboarding.dart';

import '../functions/secureStorage.dart';

class SignUp extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController fantasyTeamController = TextEditingController();
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    void saveName(String name) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('wildcard_user_id', name);
    }
    List<Widget> onboarding = [
      Lottie.network(
          "https://lottie.host/3dada0e5-f661-448f-b953-08b0bc01f970/x0s1JryJWC.json",
        errorBuilder: (context, exception, stackTrace) {
          return Center(
            child: const Icon(Icons.animation,
              size: 35,
              color: Colors.grey,
            ),
          );
        },
      ),
      Lottie.network(
          "https://lottie.host/8050bd7c-50a3-4e68-b21d-a920f50a82f1/T2S0gPOhC0.json",
        errorBuilder: (context, exception, stackTrace) {
          return Center(
            child: const Icon(Icons.animation,
              size: 35,
              color: Colors.grey,
            ),
          );
        },
      ),
      Lottie.network(
          "https://lottie.host/7ff63f62-01be-4af2-b075-1035b3241572/tYLsHqzlpV.json",
        errorBuilder: (context, exception, stackTrace) {
          return Center(
            child: const Icon(Icons.animation,
              size: 35,
              color: Colors.grey,
            ),
          );
        },
      ),
      Lottie.network(
          "https://lottie.host/0ce0c1b9-3abc-4e10-995e-73996318c1b1/fpo3myHwfr.json",
        errorBuilder: (context, exception, stackTrace) {
          return Center(
            child: const Icon(Icons.animation,
              size: 35,
              color: Colors.grey,
            ),
          );
        },
      ),
    ];
    return Stack(
      children: [
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return onboarding[index];
            },
          )
        ),
        Scaffold(
          backgroundColor: Color(0xffF7F7F9),
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                            userController.signUpError.value,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15
                            ),
                          )
                      ),
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
                        controller: fantasyTeamController,
                        hintText: 'Fantasy Team Name',
                        obscureText: false,
                      ),
                      SizedBox(height: 10,),
                      Obx(
                          ()=> userController.password1.value == userController.password2.value && userController.password1.value != ""?
                          Text('Password consistent ✅',
                            style: TextStyle(
                              color: Colors.red
                            ),
                          ):
                          Text('Password inconsistent ❌',
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                      ),
                      Container(
                        width: Get.width * 0.85,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: passwordController1,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          onChanged: (value){
                            userController.password1.value = value;
                          },
                          decoration: InputDecoration(
                              focusColor:Colors.black54,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade700)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: Get.width * 0.85,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: passwordController2,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          onChanged: (value){
                            userController.password2.value = value;
                          },
                          decoration: InputDecoration(
                              focusColor:Colors.black54,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade700)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 25,),
                      GestureDetector(
                        onTap: () async {
                          User newUser = User(
                            name: usernameController.text,
                            email: emailController.text.toLowerCase(),
                            teamName: fantasyTeamController.text,
                          );
                          await SecureStorage.writeSecureData('password', passwordController1.text);
                          userController.signUp(newUser).then((value) {
                            saveName(userController.myUser.id!);
                            Get.to(() => OnBoardingScreen(lottieAnimation: onboarding,));
                          });
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
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}