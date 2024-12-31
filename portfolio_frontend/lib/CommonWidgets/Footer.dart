import 'package:flutter/material.dart';
import 'package:portfolio/globals.dart';

class Footer {
  Widget footer(double w, double h, BuildContext context) {
    List<String> l = [
      "https://img.icons8.com/color/144/linkedin.png",
      "https://img.icons8.com/glyph-neue/64/github.png",
      "https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/48/external-level-up-your-coding-skills-and-quickly-land-a-job-logo-shadow-tal-revivo.png",
      "https://img.icons8.com/color/144/codechef.png",
      "https://img.icons8.com/fluency/48/instagram-new.png"
    ];
    return Container(
      margin: EdgeInsets.only(top: (h / 100) * 8),
      padding: EdgeInsets.only(top: (h / 100) * 3, left: w * 0.05),
      width: w,
      color: globals.greyish,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
              // 'assets/assets/images/logo.png',
              'images/logo.png',
              width: (w / 100) * 12,
              height: (h / 100) * 7,
              fit: BoxFit.contain),
          Container(
            margin: EdgeInsets.only(top: (h / 100) * 3),
            child: Text(
              "Showcasing my programming career till now!",
              style: globals.ts((w / 100) * 1.25, globals.blackish, null),
            ),
          ),
          Container(
              height: (h / 100) * 6,
              margin:
                  EdgeInsets.only(top: (h / 100) * 3, bottom: (h / 100) * 2),
              width: w * 0.3,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return footerIcon(w, h, index, l, context);
                },
              ))
          // InkWell(
          //   onTap: () {
          //     globals.launchURL(
          //         "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
          //         w,
          //         context);
          //   },
          //   child: Container(
          //       margin:
          //           EdgeInsets.only(top: (h / 100) * 4, bottom: (h / 100) * 2),
          //       color: globals.brownish,
          //       child: Image.asset(
          //         "../../assets/images/linkedin.png",
          //         width: (h / 100) * 5,
          //         height: (h / 100) * 5,
          //         fit: BoxFit.fill,
          //       )),
          // )
        ],
      ),
    );
  }

  Widget footerIcon(
      double w, double h, int i, List<String> l, BuildContext context) {
    return InkWell(
      onTap: () {
        if (i == 0) {
          globals.launchURL(
              "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
              w,
              context);
        } else if (i == 1) {
          globals.launchURL("https://github.com/Samarth-09", w, context);
        } else if (i == 2) {
          globals.launchURL("https://leetcode.com/srparekh0909/", w, context);
        } else if (i == 3) {
          globals.launchURL(
              "https://www.codechef.com/users/samarth0909", w, context);
        } else if (i == 4) {
          globals.launchURL(
              "https://www.instagram.com/samarth_9_9?igsh=MWpwcmN1MXQyZGlzdQ==",
              w,
              context);
        }
      },
      child: Container(
          margin: EdgeInsets.only(right: (w / 100) * 2),
          color: globals.transparent,
          child: Image.network(
            l[i],
            width: (w / 100) * 2.5,
            // height: (h / 100) * 3,
            fit: BoxFit.contain,
          )),
    );
  }
}
