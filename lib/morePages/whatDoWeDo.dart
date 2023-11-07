import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatDoWeDo extends StatelessWidget {
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
        title: Text('What do we do?'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.23,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Find out more about Wildcard Sports',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('The Afe Babalola University Football League, organized by the proficient coordinators from Wildcard Sports, is a vibrant and engaging platform that thrives on effective management and execution. Coordinators play a vital role in overseeing and orchestrating various aspects of the league to ensure its success. Here\'s an overview of what we to do:',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('Our Responsibilities:',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('League Management: We are responsible for overseeing and managing all league operations. This includes scheduling events, ensuring rule adherence, and handling administrative tasks.\n\nEvent Planning: We are tasked with planning and organizing all league events, from the initial kickoff to the grand championship. This involves securing venues, managing logistics, and creating a seamless event experience. \n\nTeam Coordination: We work closely with participating teams. We provide guidance, address team inquiries, and facilitate communication between teams and league authorities. \n\nOfficials and Referees: We hire and manage referees and officials to ensure fair play and uphold the league\'s rules and regulations. \n\nPromotion and Publicity: Coordinators oversee promotional efforts to boost the league\'s visibility. This includes marketing, social media engagement, and outreach to the Afe Babalola University community. \n\nRules and Regulations: We develop and enforce league rules and regulations to maintain fair competition and sportsmanship. \n\nCommunity Engagement: We foster engagement with the university community. We organize events, workshops, and activities related to sports and wellness, promoting a sense of belonging. \n\n Prize Distribution: We ensure the fair distribution of prizes and awards to winning teams and standout athletes, adding to the competitive spirit. \n\n Feedback and Improvements: We maintain open lines of communication with participants and seek feedback to continually improve the league\'s quality.',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('What we bring:',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Event Management Skills: We gain valuable experience in event planning, management, and execution. \n\n Community Building: We play a significant role in fostering a sense of community and unity within the university. \n\n Leadership Development: We enhance our leadership and organizational skills, valuable for future career prospects. \n\n Networking Opportunities: The role provides us opportunities to connect with students, faculty, and industry professionals, fostering valuable connections. \n\n Promotion and Marketing: We can showcase our marketing and promotional skills in reaching a captive audience. \n',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('In conclusion, Wildcard Sports is integral to the success of the Afe Babalola University Football League. Our role in league management, event planning, and community engagement ensures a memorable and impactful sports experience for participants while offering personal and professional growth opportunities for our group itself.',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
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
