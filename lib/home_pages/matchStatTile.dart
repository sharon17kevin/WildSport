import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchStatTile extends StatelessWidget {
  final int home;
  final String property;
  final int away;

  MatchStatTile({required this.home, required this.property, required this.away});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${home}',
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.w700,
          fontSize: 15
        ),
      ),
      title: Center(child: Text(property,
        style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: 15
        ),
      )),
      trailing: Text('${home}',
        style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w700,
            fontSize: 15
        ),
      ),
    );
  }
}
