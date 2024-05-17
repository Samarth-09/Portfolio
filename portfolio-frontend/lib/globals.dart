import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class globals {
  static int currentTab = 0;
  static Color brownish = const Color.fromARGB(255, 132, 63, 63);
  static Color transparent = const Color.fromARGB(0, 0, 0, 0);
  static Color blackish = const Color.fromARGB(255, 3, 3, 3);
  static Color greyish = const Color.fromARGB(255, 240, 240, 240);
  static Color whitish = Colors.white;
  static TextStyle ts(double fontsize, Color fontColor, FontWeight? fw) {
    return GoogleFonts.getFont("Poppins")
        .copyWith(color: fontColor, fontSize: fontsize, fontWeight: fw);
  }

  static void launchURL(String s, double w, BuildContext context) async {
    Uri u = Uri.parse(s);
    if (await launchUrl(u)) {
      SnackBar s = SnackBar(
          backgroundColor: globals.brownish,
          content: Text("Website is Unreachable!!",
              style: globals.ts((w / 100) * 2, Colors.white, null)));
      ScaffoldMessenger.of(context).showSnackBar(s);
    }
  }
}
