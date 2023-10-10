import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}

final box = GetStorage();
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  primaryColor: Colors.white,
  primaryColorDark: Color(0xffCCB28F),
  scaffoldBackgroundColor: Color(0xffF7F7F9),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.openSans(
      color: Color(0xff4A4138),
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.grey,
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: GoogleFonts.openSans(
      letterSpacing: 3,
      color: Color(0xff4A4138),
      fontSize: 16.5,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.varela(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: GoogleFonts.varela(
      color: Color(0xff7CB7AF),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.montserrat(
      color: Color(0xffF7F7F9),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: Color(0xffCCB28F),
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Color(0xff4A4138),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.montserrat(
      color: Color(0xff4A4138),
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Color(0xff4A4138),
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.varela(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Color(0xffF9EBF3),
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 20, vertical: 10)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff4A4138)),
      foregroundColor: MaterialStatePropertyAll<Color>(Color(0xffCCB28F))
    )
  ),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
  primaryColor: Color(0xff2C2E3B),//Color(0xff3D4455),
  primaryColorDark: Colors.white,
  scaffoldBackgroundColor: Color(0xff1F2024),//Color(0xff050A30),//Color(0xff1F2024),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.openSans(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Color(0xffCDBBB0),
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: GoogleFonts.openSans(
      letterSpacing: 3,
      color: Colors.white,
      fontSize: 16.5,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.varela(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: GoogleFonts.varela(
      color: Color(0xff7CB7AF),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.montserrat(
      color: Color(0xffF7F7F9),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: Color(0xffE0D3CC),
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.montserrat(
      color: Color(0xffDEDDE3),
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.varela(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Color(0xffF9EBF3),
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              )
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff3D4455)),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white)
      )
  ),
  useMaterial3: true,
);