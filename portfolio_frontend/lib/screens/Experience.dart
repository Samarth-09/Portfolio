import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Drawer.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/Providers/Experience/ExperienceProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:provider/provider.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  Appbar appbar = Appbar();
  Footer footer = Footer();
  MyDrawer myDrawer = MyDrawer();
  // late AnimationController ac;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ac = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  // }

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
                              child:
                                  Image.asset("./assets/images/experience.png",
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
                      ChangeNotifierProvider(
                        create: (context) => Experienceprovider(),
                        child: Consumer<Experienceprovider>(
                            builder: (context, value, child) {
                          // value.startLine(0);
                          return Column(
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
                                            color: globals.brownish
                                                .withAlpha(100)))
                                    .animate(
                                        // target: value.startOfAnimation[0],
                                        // onComplete: (controller) =>
                                        //     value.startLine(1)
                                        delay:
                                            const Duration(milliseconds: 100))
                                    .scaleY(
                                        duration:
                                            const Duration(milliseconds: 800),
                                        begin: 0,
                                        end: 1)
                                    .slideY(
                                        duration:
                                            const Duration(milliseconds: 800),
                                        begin: -0.5,
                                        end: 0),
                                Container(
                                        width: w,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        child: Icon(Icons.circle,
                                            size: w * 0.015,
                                            color: globals.brownish))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 1000))
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 800)),
                                Container(
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        height: h * 0.3,
                                        child: VerticalDivider(
                                            thickness: w * 0.001,
                                            color: globals.brownish
                                                .withAlpha(100)))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 1000))
                                    .scaleY(
                                        duration:
                                            const Duration(milliseconds: 800),
                                        begin: 0,
                                        end: 1)
                                    .slideY(
                                        duration:
                                            const Duration(milliseconds: 800),
                                        begin: -0.5,
                                        end: 0),
                                Container(
                                        width: w,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        child: Icon(Icons.circle,
                                            size: w * 0.015,
                                            color: globals.brownish))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 1900))
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 800)),
                                Container(
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        height: h * 0.3,
                                        child: VerticalDivider(
                                            thickness: w * 0.001,
                                            color: globals.brownish
                                                .withAlpha(100)))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 1900))
                                    .scaleY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: 0,
                                        end: 1)
                                    .slideY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: -0.5,
                                        end: 0),
                                Container(
                                        width: w,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        child: Icon(Icons.circle,
                                            size: w * 0.015,
                                            color: globals.brownish))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 2800))
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 800)),
                                Container(
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        height: h * 0.3,
                                        child: VerticalDivider(
                                            thickness: w * 0.001,
                                            color: globals.brownish
                                                .withAlpha(100)))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 2800))
                                    .scaleY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: 0,
                                        end: 1)
                                    .slideY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: -0.5,
                                        end: 0),
                                Container(
                                        width: w,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        child: Icon(Icons.circle,
                                            size: w * 0.015,
                                            color: globals.brownish))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 3700))
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 800)),
                                Container(
                                        margin: EdgeInsets.only(top: h * 0.01),
                                        height: h * 0.3,
                                        child: VerticalDivider(
                                            thickness: w * 0.001,
                                            color: globals.brownish
                                                .withAlpha(100)))
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 3700))
                                    .scaleY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: 0,
                                        end: 1)
                                    .slideY(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: -0.5,
                                        end: 0),
                              ]);
                        }),
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
                                  "Healthcare Informatics",
                                  "Vadodara, Gujarat",
                                  "Working as an .net developer right cureently. I am working on the project called AI chatbot with Grounded dataset.",
                                  "https://www.linkedin.com/company/healthcare-informatics-its-pvt-ltd/"),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.053),
                                child: ExpCard2(
                                    w,
                                    h,
                                    "May 2024 - July 2024",
                                    "Software Engineer Intern",
                                    "WictroniX",
                                    "Vadodara, Gujarat",
                                    "Had a great learning experience at Wictronix. I was assigned 2 projects. First was a personel branding website where i worked with vanilla javascript and CSS. And the second one was a mobile application made using Flutter. My responsibilty was to implement the UI according to the Figma template provided. I also made a fronted for chatbot with backend intergration",
                                    "https://www.linkedin.com/company/wictronix/"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.053),
                                child: ExpCard1(
                                    w,
                                    h,
                                    "January 2024 - 36 hours",
                                    "Hackathon - Backend Role",
                                    "DotSlah 7.0",
                                    "SVNIT, Surat",
                                    "Made a collaborative problem solving platform. My role was to develop Rest Apis using Node/Express for various services and to develop the unique rating algorithm used in the project.",
                                    "https://devfolio.co/projects/doubtbuddyx-47f0"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.053),
                                child: ExpCard2(
                                    w,
                                    h,
                                    "February 2024 - 36 hours",
                                    "Hackathon - Backend Role",
                                    "DuHacks 3.0",
                                    "DDU, Nadiad",
                                    "Made a collaborative bridge between NGOs and Volunteers. My role was to develop Rest Apis using Node/Express for various services with customized data response",
                                    "https://devfolio.co/projects/ngoally-37c1"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: h * 0.053),
                                child: ExpCard1(
                                    w,
                                    h,
                                    "February 2023 - 36 hours",
                                    "Hackathon - Frontend Role",
                                    "DuHack 2.0",
                                    "DDU, Nadiad",
                                    "Made a user friendly Student Portal. My role was to develop Frontend for the mobile application with backend integration using Flutter.",
                                    "https://devfolio.co/projects/campusbase-7f26"),
                              ),
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
        return Scaffold(
            appBar: appbar.mAppbar(w),
            drawer: myDrawer.drawer(w, h, context),
            body: Container(
                color: globals.whitish,
                width: w,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 3),
                      child: Text("Experience - Participations",
                          style: globals.ts((w / 100) * 6, globals.brownish,
                              FontWeight.bold))),
                  Container(
                          // margin: EdgeInsets.only(top: (h / 100) * 1),
                          padding:
                              EdgeInsets.symmetric(horizontal: (w / 100) * 4),
                          child: Divider(color: globals.brownish))
                      .animate()
                      .scaleX(
                          begin: 0,
                          end: 1,
                          duration: const Duration(milliseconds: 700),
                          delay: const Duration(milliseconds: 300)),
                  // Container(
                  //     width: w, height: (h / 100) * 2, color: globals.whitish),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (w / 100) * 4, vertical: (h / 100) * 2),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(children: [
                            Container(
                                margin: EdgeInsets.only(top: (h / 100) * 2),
                                child: Icon(Icons.circle,
                                    size: (w / 100) * 5,
                                    color: globals.brownish)),
                            Container(
                                    height: h * 0.305,
                                    margin: EdgeInsets.only(top: (h / 100) * 1),
                                    child: VerticalDivider(
                                        thickness: 0.5,
                                        color: globals.brownish.withAlpha(200)))
                                .animate(
                                    // target: value.startOfAnimation[0],
                                    // onComplete: (controller) =>
                                    //     value.startLine(1)
                                    delay: const Duration(milliseconds: 100))
                                .scaleY(
                                    duration: const Duration(milliseconds: 800),
                                    begin: 0,
                                    end: 1)
                                .slideY(
                                    duration: const Duration(milliseconds: 800),
                                    begin: -0.5,
                                    end: 0),
                            Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Icon(Icons.circle,
                                        size: (w / 100) * 5,
                                        color: globals.brownish))
                                .animate(
                                    delay: const Duration(milliseconds: 1000))
                                .fadeIn(
                                    duration:
                                        const Duration(milliseconds: 800)),
                            Container(
                                    height: h * 0.305,
                                    margin: EdgeInsets.only(top: (h / 100) * 1),
                                    child: VerticalDivider(
                                        thickness: 0.5,
                                        color: globals.brownish.withAlpha(200)))
                                .animate(
                                    // target: value.startOfAnimation[0],
                                    // onComplete: (controller) =>
                                    //     value.startLine(1)
                                    delay: const Duration(milliseconds: 1000))
                                .scaleY(
                                    duration: const Duration(milliseconds: 800),
                                    begin: 0,
                                    end: 1)
                                .slideY(
                                    duration: const Duration(milliseconds: 800),
                                    begin: -0.5,
                                    end: 0),
                            Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Icon(Icons.circle,
                                        size: (w / 100) * 5,
                                        color: globals.brownish))
                                .animate(
                                    delay: const Duration(milliseconds: 1900))
                                .fadeIn(
                                    duration:
                                        const Duration(milliseconds: 800)),
                            Container(
                                    height: h * 0.305,
                                    margin: EdgeInsets.only(top: (h / 100) * 1),
                                    child: VerticalDivider(
                                        thickness: 0.5,
                                        color: globals.brownish.withAlpha(200)))
                                .animate(
                                    // target: value.startOfAnimation[0],
                                    // onComplete: (controller) =>
                                    //     value.startLine(1)
                                    delay: const Duration(milliseconds: 1900))
                                .scaleY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: 0,
                                    end: 1)
                                .slideY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: -0.5,
                                    end: 0),
                            Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Icon(Icons.circle,
                                        size: (w / 100) * 5,
                                        color: globals.brownish))
                                .animate(
                                    delay: const Duration(milliseconds: 2800))
                                .fadeIn(
                                    duration:
                                        const Duration(milliseconds: 800)),
                            Container(
                                    height: h * 0.305,
                                    margin: EdgeInsets.only(top: (h / 100) * 1),
                                    child: VerticalDivider(
                                        thickness: 0.5,
                                        color: globals.brownish.withAlpha(200)))
                                .animate(
                                    // target: value.startOfAnimation[0],
                                    // onComplete: (controller) =>
                                    //     value.startLine(1)
                                    delay: const Duration(milliseconds: 2800))
                                .scaleY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: 0,
                                    end: 1)
                                .slideY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: -0.5,
                                    end: 0),
                            Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Icon(Icons.circle,
                                        size: (w / 100) * 5,
                                        color: globals.brownish))
                                .animate(
                                    delay: const Duration(milliseconds: 3700))
                                .fadeIn(
                                    duration:
                                        const Duration(milliseconds: 800)),
                            Container(
                                    height: h * 0.2,
                                    margin: EdgeInsets.only(top: (h / 100) * 1),
                                    child: VerticalDivider(
                                        thickness: 0.5,
                                        color: globals.brownish.withAlpha(200)))
                                .animate(
                                    // target: value.startOfAnimation[0],
                                    // onComplete: (controller) =>
                                    //     value.startLine(1)
                                    delay: const Duration(milliseconds: 3700))
                                .scaleY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: 0,
                                    end: 1)
                                .slideY(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    begin: -0.5,
                                    end: 0),
                          ]),
                          Container(
                            margin: EdgeInsets.only(
                                left: (w / 100) * 4, top: (h / 100) * 1.2),
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: (h / 100) * 0.2),
                                    child: mExpCard1(
                                        w,
                                        h,
                                        "Dec 2025 - Present",
                                        "Software Developer Intern",
                                        "Healthcare Informatics",
                                        "Vadodara, Gujarat",
                                        "Working as an .net developer right now. I am working on the project called AI chatbot with Grounded dataset.",
                                        "https://www.linkedin.com/company/healthcare-informatics-its-pvt-ltd/"),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: h * 0.18),
                                    child: mExpCard1(
                                        w,
                                        h,
                                        "May 2024 - July 2024",
                                        "Software Engineer Intern",
                                        "WictroniX",
                                        "Vadodara, Gujarat",
                                        "Had a great learning experience at Wictronix. I was assigned 2 projects. First was a personel branding website where i worked with vanilla javascript and CSS. And the second one was a mobile application made using Flutter. My responsibilty was to implement the UI according to the Figma template provided. I also made a fronted for chatbot with backend intergration",
                                        "https://www.linkedin.com/company/wictronix/"),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: h * 0.18),
                                    child: mExpCard1(
                                        w,
                                        h,
                                        "January 2024 - 36 hrs",
                                        "Hackathon - Backend Role",
                                        "DotSlash 7.0",
                                        "SVNIT, Surat",
                                        "Made a collaborative problem solvoing platform. My role was to develop Rest Apis using Node/Express for various services and to develop the unique rating algorithm used in the project.",
                                        "https://devfolio.co/projects/doubtbuddyx-47f0"),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: h * 0.18),
                                    child: mExpCard1(
                                        w,
                                        h,
                                        "February 2024 - 36 hrs",
                                        "Hackathon - Backend Role",
                                        "DuHacks 3.0",
                                        "DDU, Nadiad",
                                        "Made a bridge between NGOs and Volunteers. My role was to develop Rest Apis using Node/Express for various services with customized data response",
                                        "https://devfolio.co/projects/ngoally-37c1"),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: h * 0.18),
                                    child: mExpCard1(
                                        w,
                                        h,
                                        "February 2023 - 36 hrs",
                                        "Hackathon - Frontend Role",
                                        "DuHack 2.0",
                                        "DDU, Nadiad",
                                        "Made a user friendly Student Portal. My role was to develop Frontend for the mobile application with backend integration using Flutter.",
                                        "https://devfolio.co/projects/campusbase-7f26"),
                                  )
                                ]),
                          )
                        ]),
                  )
                ]))));
      }
    });
  }

  Widget mExpCard1(double w, double h, String date, String role,
      String companyname, String loc, String desc, String linktocompany) {
    return Container(
      height: h * 0.35,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyname,
              style:
                  globals.ts((w / 100) * 6, globals.blackish, FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: (h / 100) * 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(role,
                      style: globals.ts(
                          (w / 100) * 3, globals.blackish, FontWeight.bold)),
                  Container(
                      height: (h / 100) * 2,
                      margin: EdgeInsets.only(
                          right: (h / 100) * 0.1, left: (h / 100) * 0.1),
                      child: VerticalDivider(
                          color: globals.brownish, thickness: 0.5)),
                  Text(date,
                      style: globals.ts(
                          (w / 100) * 3, globals.blackish, FontWeight.bold)),
                ],
              ),
            ),
            Container(
                width: w *
                    0.8, //have to provide it as this <- column <- ROW:- row can generate pixel overflow
                margin: EdgeInsets.only(top: (h / 100) * 2),
                child: Text(desc,
                    textAlign: TextAlign.justify,
                    style: globals
                        .ts((w / 100) * 3.5, globals.blackish, null)
                        .copyWith(height: 1.5))),
          ]),
    );
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
