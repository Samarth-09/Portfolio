import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Buttons.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/Providers/Projects/ProjectsProvider.dart';
// import 'package:portfolio/Providers/Projects/ProjectsProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Buttons bttn = Buttons();
  Appbar appbar = Appbar();
  Footer footer = Footer();
  Map<String, dynamic> p1 = {
        "name": "SMARTDIAGNOSEHUB",
        "tech": ["Flutter", "NodeJs/ExpressJs", "Flask", "MongoDB", "ML"],
        "desc":
            "SmartDiagnoseHub enables users to predict the presence of diseases like Diabetes, Parkinson’s, and Heart Disease based on report values. Users access detailed disease descriptions, relevant solutions, and can track their disease history. Frontend utilizes the industry-standard BloC-Cubits state management library. Node.js system handles 100 concurrent requests within a maximum of 122 milliseconds for managing user history. Disease prediction for users takes under 1-3 seconds. Code is structured with modular coding style and descriptive names. Implemented ML models include Decision Tree (96.17%) and Random Forest (98.25%) for disease prediction.",
        "code": "https://github.com/Samarth-09/SmartDaignoseHub",
        "images": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
      },
      p2 = {
        "name": "MYMONEY",
        "tech": ["Flutter", "Firebase(authentication, firestore)"],
        "desc":
            "MyMoney simplifies financial management where Users can easily monitor expenses and record transactions for seamless budgeting and financial planning. Implemented State-Management with a popular package in flutter called Provider. Application will facilitate 30% faster tracking of Elaborated transactional-records.",
        "code": "https://github.com/Samarth-09/mymoney",
        "live": "https://transcendent-sprinkles-229a41.netlify.app/",
        "images": [1, 2, 3, 4]
      },
      p3 = {
        "name": "NGOALLY",
        "tech": ["ReactJs", "NodeJs/ExpressJs", "MongoDB"],
        "desc":
            "NGOAlly is a dynamic platform designed to bridge the gap between Non-Governmental Organizations (NGOs) and volunteers. It empowers NGOs to create and share campaigns, allowing volunteers to discover and apply for initiatives that resonate with their interests and skills. Our platform provides a wide range of volunteer opportunities across various causes, including healthcare, environmental conservation, social services, technology and many more. This document provides an overview of the project, its workflow for volunteers and NGOs, the technology stack used, and information about the development team.. Developed Node.js REST APIs to handle 100 concurrent requests within 150 milliseconds. Optimized workflows, reducing campaign browsing time by 30%. Improved volunteer request management for streamlined processes.",
        "code": "https://github.com/Samarth-09/NGOAlly",
        "images": [1, 2, 3, 4, 5]
      },
      p4 = {
        "name": "DOUBTBUDDY24x7",
        "tech": [
          "ReactJs",
          "NodeJs/ExpressJs",
          "Flask",
          "MongoDB",
          "NLP",
          "Zego Cloud"
        ],
        "desc":
            "DoubtBuddy24x7 is an innovative platform designed to facilitate collaborative problem-solving in the coding community. The system acts as a centralized hub where our platform matches the right error solver(user) for the doubt askers(user). It leverages a unique rating system based on their doubt-asker’s reviews, offering a transparent reflection of an individual's error-solving skills.Developed REST APIs in Node.js with modular coding style. Implemented a unique rating algorithm utilizing user reviews processed by DistilBERT NLP model. Achieved a 95% accuracy in matching doubt askers with suitable doubt solvers.",
        "code": "https://github.com/manav278/DotSlash7.0-DoubtBuddy24x7",
        "images": [1, 2, 3, 4, 5]
      },
      p5 = {
        "name": "CALCULATOR",
        "tech": ["Flutter", "Shared Preferences"],
        "desc":
            "Its a Calculator app made using Flutter capable of doing basic math operations",
        "code": "https://github.com/Samarth-09/calculator",
        "images": [1]
      },
      p6 = {
        "name": "STC-PORTAL",
        "tech": ["Flutter", "Firebase(Authentication, FireStore)"],
        "desc":
            "STC Portal is an Android app facilitating student and teacher result management. It offers personalized dashboards for students to track academic performance with 20% more convenience, including grades and exam scores. Teachers efficiently input grades through the portal’s interface.",
        "code": "https://github.com/Samarth-09/stc_portal",
        "images": [1]
      };
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double w = constraints.maxWidth, h = constraints.maxHeight;
      List<Map<String, dynamic>> p = [p1, p2, p3, p4, p5, p6];
      List<Widget> projects = List.generate(
          6, (index) => projectDetailCard(w, h, p[index], context, index + 1));
      return Scaffold(
          appBar: appbar.appbar(w, h, context),
          body: Container(
              color: Colors.white,
              width: w,
              height: h,
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                      children: [...projects, footer.footer(w, h, context)]))));
    });
  }

  Widget projectDetailCard(double w, double h, Map<String, dynamic> data,
      BuildContext context, int i) {
    double cardWidth = w * 0.9;
    int idx = 0;
    List<Widget> imageWidgets = List.generate(
        int.parse(data['images'].length.toString()),
        (index) => InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: globals.transparent.withAlpha(0),
                        surfaceTintColor: globals.transparent.withAlpha(0),
                        child: Stack(
                          children: [
                            Image.asset(
                              'images/project/p$i/img${data['images'][idx]}.png',
                              width: w * 0.9,
                              height: h * 0.9,
                              // fit: BoxFit.fill
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 8),
                                color: globals.brownish,
                                child: Text(
                                  'X',
                                  style: globals.ts((w / 100) * 1.2,
                                      Colors.white, FontWeight.w900),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Image.asset(
                // 'assets/assets/images/project/p$i/img${data['images'][index]}.png',
                'images/project/p$i/img${data['images'][index]}.png',
                // width: w*0.4,
                height: h * 0.6,
                // fit: BoxFit.fill
              ),
            ));
    return Container(
      // padding: EdgeInsets.all(10),
      // width: w * 0.9,
      width: cardWidth,
      // height: h * 0.7,
      margin: EdgeInsets.only(top: (h / 100) * 8),
      decoration: BoxDecoration(
          border: Border.all(color: globals.blackish, width: 1.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          color: globals.greyish),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: cardWidth / 2,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Technologies used:- ",
                        style: globals.ts(
                            (w / 100) * 1, globals.blackish, FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      width: w * 0.4,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...List.generate(data['tech'].length,
                              (index) => tech(w, h, data['tech'][index], index))
                        ]),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: (h / 100) * 3),
                        child: Text("Desciption:- ",
                            style: globals.ts((w / 100) * 1, globals.blackish,
                                FontWeight.bold))),
                    Container(
                        margin: EdgeInsets.only(top: (h / 100) * 1),
                        child: Text(data['desc'],
                            textAlign: TextAlign.justify,
                            style: globals.ts(
                                (w / 100) * 1, globals.blackish, null))),
                    // ChangeNotifierProvider(
                    //   create: (context) => ProjectsProvider(),
                    //   child: Consumer<ProjectsProvider>(
                    //       builder: (context, value, child) {
                    //     return Container(
                    //       margin: EdgeInsets.only(top: (h / 100) * 6),
                    //       child: bttn.projectButton(w, h, "Source Code",
                    //           data['code'], value.bttnClr, context),
                    //     );
                    //   }),
                    // ),
                    //  Container(
                    //       margin: EdgeInsets.only(top: (h / 100) * 6),
                    //       child: bttn.projectButton(w, h, "Source Code",
                    //           data['code'], globals.brownish, context),
                    //     ),
                    (data['live'] == null)
                        ? ChangeNotifierProvider(
                            create: (context) => ProjectsProvider(),
                            child: Consumer<ProjectsProvider>(
                                builder: (context, value, child) {
                              return Container(
                                margin: EdgeInsets.only(top: (h / 100) * 6),
                                child: bttn.projectButton(
                                    w,
                                    h,
                                    "Source Code",
                                    data['code'],
                                    globals.brownish,
                                    context,
                                    value),
                              );
                            }))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ChangeNotifierProvider(
                                  create: (context) => ProjectsProvider(),
                                  child: Consumer<ProjectsProvider>(
                                      builder: (context, value, child) {
                                    return Container(
                                      // width: cardWidth/4,
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 6),
                                      child: bttn.projectButton(
                                          w,
                                          h,
                                          "Source Code",
                                          data['code'],
                                          globals.brownish,
                                          context,
                                          value),
                                    );
                                  })),
                              ChangeNotifierProvider(
                                  create: (context) => ProjectsProvider(),
                                  child: Consumer<ProjectsProvider>(
                                      builder: (context, value, child) {
                                    return Container(
                                      // width: cardWidth/4,
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 7),
                                      child: bttn.projectButton(
                                          w,
                                          h,
                                          "Live Demo",
                                          data['live'],
                                          globals.transparent,
                                          context,
                                          value),
                                    );
                                  }))
                            ],
                          )

                    // (data['live'] == null)
                    //     ? Container()
                    //     : Container(
                    //         margin: EdgeInsets.only(top: (h / 100) * 7),
                    //         child: bttn.projectButton(w, h, "Live Demo",
                    //             data['live'], globals.transparent, context),
                    //       )
                  ],
                ),
              ),
            ),

            Container(
                // width: w * 0.49,
                width: cardWidth / 2.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(color: globals.blackish, width: 1.5))),
                // height: h * 0.6,
                child: Stack(children: [
                  ImageSlideshow(
                    width: double.infinity,
                    height: h * 0.7,
                    initialPage: 0,
                    indicatorColor: globals.brownish,
                    indicatorBackgroundColor: globals.greyish,
                    onPageChanged: (value) {
                      // print('Page changed: $value');
                      idx = value;
                    },
                    autoPlayInterval: 5000,
                    isLoop: true,
                    children: imageWidgets,
                  ),
                  Positioned(
                      left: (w / 100) * 2,
                      top: (h / 100) * 5,
                      child: bttn.projectTitle(w, h, data['name']))
                ])),
            // Image.asset("/images/mymoney.png",
            //     width: w * 0.49, height: h * 0.7, fit: BoxFit.fill),
          ]),
    );
  }

  Widget tech(double w, double h, String s, int i, [String? url]) {
    return Container(
        margin: EdgeInsets.only(left: (w / 100) * 1.5),
        padding: EdgeInsets.symmetric(
            vertical: (h / 100) * 1, horizontal: (w / 100) * 0.75),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border:
                Border.all(width: (w / 100) * 0.1, color: globals.transparent),
            color: globals.brownish),
        child:
            Text(s, style: globals.ts((w / 100) * 1, globals.whitish, null)));
  }
}
