import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQs extends StatelessWidget {
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
        title: Text('FAQs'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Welcome to the Afe Babalola Football Fantasy League FAQs. Find answers to common questions about our fantasy league and stay updated with the latest news and information.',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Q1:Getting Started\n\nHow do I sign up for the Afe Babalola Football League?\nA1: To sign up, visit our registration page and follow the steps provided. You'll need to create an account and provide some basic information to get started.\n\n\nQ2: Can I participate in the fantasy league for free?\nA2: Yes, you can join our fantasy league for free. We also offer premium features for enhanced gameplay.\n\n\nFantasy League Rules\n\nQ3: What are the rules for team selection in the fantasy league?\nA3: Team selection is based on a specific budget. You can pick players within your budget while adhering to position and squad limits.\n\nQ4: How are points calculated in the fantasy league?\nA4: Points are awarded based on player performance in real matches. Points are assigned for goals, assists, clean sheets, and more.\n\n\nNews and Updates\n\nQ5: Where can I find the latest football news and updates?\nA5: You can access the latest news and updates on our \"News\" page. We provide articles, match reports, and other football-related content.\n\nQ6: How often is the content on the website updated?\nA6: We strive to update our content regularly to keep you informed about the latest developments in the world of football.\n\n\nTechnical Support\n\nQ7: I'm experiencing technical issues with the website. How can I get help?\nA7: If you encounter technical problems, please reach out to our support team. You can contact us via email at support@afefootballleague.com or use our live chat for immediate assistance.\n\nQ8: What are the system requirements for the website?\nA8: The website is designed to be compatible with modern web browsers and mobile devices. Make sure your browser is up to date for the best experience.\n\n\nContact Information\n\nQ9: How can I contact the Afe Babalola Football League team?\nA9: If you have questions or need further assistance, you can contact our team via email at contact@afefootballleague.com.\n\n\nFeedback\n\nQ10: How can I provide feedback on the FAQs and the website?\nA10: We value your feedback. Use the rating feature provided for each FAQ to let us know if the information was helpful or if you have suggestions for improvement.",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("We hope this FAQs page answers your questions. If you need additional assistance or have inquiries not covered here, please don't hesitate to reach out to our support team.",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
