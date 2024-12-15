import 'package:flutter/material.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/globals.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  Appbar appbar = Appbar();
  Footer footer = Footer();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double w = constraints.maxWidth, h = constraints.maxHeight;
      if (w > 1200) {
        return Scaffold(
            appBar: appbar.appbar(w, h, context),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        width: w * 0.9,
                        margin: EdgeInsets.only(top: (h / 100) * 4),
                        child: Row(
                          children: [
                            Text(
                              "Experience - Participations",
                              style: globals.ts((w / 100) * 2.5,
                                  globals.blackish, FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: (w / 100) * 2),
                              child: Image.asset("./images/experience.png",
                                  width: (w / 100) * 6,
                                  // height: (h / 100) * 7,
                                  fit: BoxFit.contain),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: (h / 100) * 1),
                        width: w * 0.9,
                        child: Divider(color: globals.greyish, thickness: 1.5)),
                    Stack(children: [
                      Container(
                        // color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: h * 0.1),
                                  child: Icon(Icons.circle,
                                      size: w * 0.015,
                                      color: globals.brownish)),
                              Container(
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  height: h * 0.3,
                                  child: VerticalDivider(
                                      thickness: w * 0.001,
                                      color: globals.brownish.withAlpha(100))),
                              Container(
                                  width: w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  child: Icon(Icons.circle,
                                      size: w * 0.015,
                                      color: globals.brownish)),
                              Container(
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  height: h * 0.26,
                                  child: VerticalDivider(
                                      thickness: w * 0.001,
                                      color: globals.brownish.withAlpha(100))),
                              Container(
                                  width: w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  child: Icon(Icons.circle,
                                      size: w * 0.015,
                                      color: globals.brownish)),
                              Container(
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  height: h * 0.3,
                                  child: VerticalDivider(
                                      thickness: w * 0.001,
                                      color: globals.brownish.withAlpha(100))),
                              Container(
                                  width: w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  child: Icon(Icons.circle,
                                      size: w * 0.015,
                                      color: globals.brownish)),
                              Container(
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  height: h * 0.26,
                                  child: VerticalDivider(
                                      thickness: w * 0.001,
                                      color: globals.brownish.withAlpha(100))),
                              Container(
                                  width: w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  child: Icon(Icons.circle,
                                      size: w * 0.015,
                                      color: globals.brownish)),
                              Container(
                                  margin: EdgeInsets.only(top: h * 0.01),
                                  height: h * 0.25,
                                  child: VerticalDivider(
                                      thickness: w * 0.001,
                                      color: globals.brownish.withAlpha(100))),
                            ]),
                      ),
                      Container(
                        // color: Colors.white,
                        width: w,
                        margin: EdgeInsets.only(top: h * 0.1),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ExpCard1(
                                  w,
                                  h,
                                  "Dec 2025 - Present",
                                  "Software Developer Intern",
                                  "Healtcare Informatics",
                                  "Vadodara, Gujarat",
                                  "I am working as an .net developer right now. I am working on the project called AI chatbot with Grounded dataset.",
                                  "https://www.linkedin.com/company/healthcare-informatics-its-pvt-ltd/"),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.055),
                                child: ExpCard2(
                                    w,
                                    h,
                                    "May 2024 - July 2024",
                                    "Software Engineer Intern",
                                    "WictroniX",
                                    "Vadodara, Gujarat",
                                    "I had a great learning experience at Wictronix. I was assigned 2 projects. First was a personel branding website where i worked with vanilla javascript and CSS. And the second one was a mobile application made using Flutter. My responsibilty was to implement the UI according to the Figma template provided. I also made a fronted for chatbot with backend intergration",
                                    "https://www.linkedin.com/company/wictronix/"),
                              ),
                              ExpCard1(
                                  w,
                                  h,
                                  "January 2024 - 36 hours",
                                  "Hackathon - Backend Role",
                                  "DotSlah 7.0",
                                  "SVNIT, Surat",
                                  "I was part of these amazing learning journey. We made a collaborative problem solvoing platform. My role was to develop Rest Apis using Node/Express for various services and to develop the unique rating algorithm used in the project.",
                                  "https://devfolio.co/projects/doubtbuddyx-47f0"),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.055),
                                child: ExpCard2(
                                    w,
                                    h,
                                    "February 2024 - 36 hours",
                                    "Hackathon - Backend Role",
                                    "DuHacks 3.0",
                                    "DDU, Nadiad",
                                    "I was part of these amazing learning journey. We made a bridge between NGOs and Volunteers. My role was to develop Rest Apis using Node/Express for various services with customized data response",
                                    "https://devfolio.co/projects/ngoally-37c1"),
                              ),
                              ExpCard1(
                                  w,
                                  h,
                                  "February 2023 - 36 hours",
                                  "Hackathon - Frontend Role",
                                  "DuHack 2.0",
                                  "DDU, Nadiad",
                                  "I was part of these amazing learning journey. We made a user friendly Student Portal. My role was to develop Frontend for the mobile application with backend integration using Flutter.",
                                  "https://devfolio.co/projects/campusbase-7f26"),
                              // Container(height: h * 0.1, color: Colors.white),
                              footer.footer(w, h, context)
                            ]),
                      )
                    ]),
                  ],
                ),
              ),
            ));
      } else {
        return Container();
      }
    });
  }

  Widget ExpCard1(double w, double h, String date, String role,
      String companyname, String loc, String desc, String linktocompany) {
    return SizedBox(
      height: h * 0.3,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(date,
                      style: globals.ts(w * 0.01, globals.blackish, null)),
                  Text(role,
                      style: globals.ts(
                          w * 0.02, globals.blackish, FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
                width: w * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment:
                  //     MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: InkWell(
                        focusColor: Colors.white.withAlpha(0),
                        hoverColor: Colors.white.withAlpha(0),
                        splashColor: Colors.white.withAlpha(0),
                        highlightColor: Colors.white.withAlpha(0),
                        onTap: () {
                          globals.launchURL(linktocompany, w, context);
                        },
                        child: Text(companyname,
                            style: globals
                                .ts(w * 0.02, globals.blackish, FontWeight.bold)
                                .copyWith(
                                    decoration: TextDecoration.underline)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: h * 0.01),
                      child: Text(loc,
                          style: globals.ts(w * 0.01, globals.blackish, null)),
                    ),
                    Container(
                      width: w * 0.35,
                      margin: EdgeInsets.only(top: h * 0.01),
                      child: Text(desc,
                          textAlign: TextAlign.justify,
                          style: globals.ts(w * 0.01, globals.blackish, null)),
                    )
                  ],
                ))
          ]),
    );
  }

  Widget ExpCard2(double w, double h, String date, String role,
      String companyname, String loc, String desc, String linktocompany) {
    return SizedBox(
      height: h * 0.3,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: w * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment:
                  //     MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      focusColor: Colors.white.withAlpha(0),
                      hoverColor: Colors.white.withAlpha(0),
                      splashColor: Colors.white.withAlpha(0),
                      highlightColor: Colors.white.withAlpha(0),
                      onTap: () {
                        globals.launchURL(linktocompany, w, context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 0),
                        child: Text(companyname,
                            style: globals
                                .ts(w * 0.02, globals.blackish, FontWeight.bold)
                                .copyWith(
                                    decoration: TextDecoration.underline)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: h * 0.01),
                      child: Text(loc,
                          style: globals.ts(w * 0.01, globals.blackish, null)),
                    ),
                    Container(
                      width: w * 0.35,
                      margin: EdgeInsets.only(top: h * 0.01),
                      child: Text(desc,
                          textAlign: TextAlign.justify,
                          style: globals.ts(w * 0.01, globals.blackish, null)),
                    )
                  ],
                )),
            Container(
              width: w * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date,
                      style: globals.ts(w * 0.01, globals.blackish, null)),
                  Text(role,
                      style: globals.ts(
                          w * 0.02, globals.blackish, FontWeight.bold)),
                ],
              ),
            )
          ]),
    );
  }
}
