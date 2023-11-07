import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatelessWidget {
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
        title: Text('Overview'),
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
                child: Text('Find out more about the ABUAD Football League',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('The Afe Babalola University Football League is a dynamic and engaging platform that unites students, faculty, and alumni in the spirit of sportsmanship, teamwork, and physical fitness. This vibrant league fosters a strong sense of community and competition within the prestigious Afe Babalola University.',
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
                  child: Text('What to expect:',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Team Formation: Students at Afe Babalola University eagerly assemble into spirited teams, each with its unique name and colors, to engage in a diverse range of sports and games.\n\nInclusivity: Afe Babalola University recognizes the diverse interests of its community, ensuring that everyone can participate in sports or activities that align with their passions.\n\nCompetitive Tiers: Teams are categorized into different competitive tiers, guaranteeing fair matches and an equitable playing field for all participants. \n\nAcademic-Year Schedule: The league follows the school calendar, with carefully planned fixtures and tournaments spanning the academic year, providing ample opportunities for involvement. \n\nDiverse Roles: Afe Babalola University\'s sports league invites students, professors, staff, and alumni to actively participate as coaches, referees, or ardent supporters, enriching the sense of togetherness. \n\nAwards and Recognition: Outstanding teams and exceptional athletes receive honors, trophies, and acknowledgment at the end of the season, instilling a sense of achievement and school pride. \n\nWellness and Unity: Beyond physical fitness, the league promotes mental well-being and offers a pleasant escape from academic stress through recreational pursuits. \n\nSchool Spirit: The league is a hub for kindling and nurturing school spirit. It encourages students and supporters to gather, rally behind their peers, and revel in an atmosphere of school pride and belonging. \n",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('The Afe Babalola University Football League embodies the ideals of enjoyment, sportsmanship, and competition within our school community. It provides a stage for students to shine in their chosen disciplines, cultivating enduring friendships and memories. Whether you\'re a star athlete or simply looking to stay active and connected, the league welcomes one and all. Join us as we celebrate the joy of sports, camaraderie, and achievement at Afe Babalola University.',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
