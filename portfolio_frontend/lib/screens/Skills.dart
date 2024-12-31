import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Drawer.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/Providers/Skills/SkillsProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:provider/provider.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with TickerProviderStateMixin {
  Appbar appbar = Appbar();
  Footer footer = Footer();
  MyDrawer myDrawer = MyDrawer();
  List<String> langs = ["C/C++", "Dart", "Javascript", "Java", "C#", "SQL"];
  List<String> langIcons = [
    "https://img.icons8.com/fluency/144/c-plus-plus-logo.png",
    // "https://img.icons8.com/color/144/000000/c%2B%2B.png"
    "https://img.icons8.com/color/144/dart.png",
    "https://img.icons8.com/color/144/javascript--v1.png",
    "https://img.icons8.com/fluency/144/java-coffee-cup-logo.png",
    "https://img.icons8.com/color/48/c-sharp-logo.png",
    "https://img.icons8.com/ios/50/sql.png"
  ];
  List<String> backendtechs = ["NodeJs", "ExpressJs", "Asp.Net Core"];
  List<String> backendtechIcons = [
    "https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/24/external-nodejs-is-an-open-source-cross-platform-javascript-run-time-environment-logo-shadow-tal-revivo.png",
    "https://img.icons8.com/fluency/144/express-js.png",
    "https://img.icons8.com/color/48/microsoft.png"
  ];
  List<String> frontendTechs = ["Flutter", "HTML", "CSS", "ReactJs"];
  List<String> frontendTechIcons = [
    "https://img.icons8.com/fluency/144/flutter.png",
    "https://img.icons8.com/fluency/144/html-5.png",
    "https://img.icons8.com/fluency/144/css3.png",
    "https://img.icons8.com/office/40/react.png"
  ];
  List<String> databases = [
    "GraphQL",
    "FireBase",
    "MongoDB",
    "MySQl",
    "PostgreSQL"
  ];
  List<String> databaseIcons = [
    "https://img.icons8.com/external-tal-revivo-color-tal-revivo/24/external-graphql-an-open-source-data-query-and-manipulation-language-for-api-logo-color-tal-revivo.png",
    "https://img.icons8.com/color/144/firebase.png",
    "https://img.icons8.com/color/96/mongo-db.png",
    "https://img.icons8.com/fluency/144/my-sql.png",
    "https://img.icons8.com/color/144/postgreesql.png"
  ];
  List<String> devTools = ["Postman", "VS Code", "Git", "GitHub"];
  List<String> devToolIcons = [
    "https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/48/external-postman-is-the-only-complete-api-development-environment-logo-shadow-tal-revivo.png",
    "https://img.icons8.com/fluency/144/visual-studio.png",
    "https://img.icons8.com/color/144/git.png",
    "https://img.icons8.com/fluency/144/github.png"
  ];
  List<String> core = [
    "Competitive Programming",
    "OOP",
    "DBMS",
    "OS",
    "Software Engineering"
  ];
  List<String> coreIcons = [
    "https://img.icons8.com/badges/96/programming.png",
    "https://img.icons8.com/external-solidglyph-m-oki-orlando/64/external-object-oriented-programming-programming-solid-solidglyph-m-oki-orlando.png",
    "https://img.icons8.com/ios-filled/100/remove-data.png",
    "https://img.icons8.com/fluency/144/operating-system.png",
    "https://img.icons8.com/ios/100/software-box.png"
  ];
  late AnimationController ac;
  @override
  void initState() {
    super.initState();
    ac = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    ac.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ac.reset();
      }
    });
  }

  Key k1 = Key("1"), k2 = Key("2");
  @override
  Widget build(BuildContext context) {
    double w, h;
    return LayoutBuilder(builder: (context, constraints) {
      w = constraints.maxWidth;
      h = constraints.maxHeight;
      if (w > 1200) {
        return Scaffold(
          appBar: appbar.appbar(w, h, context),
          body: Container(
              width: w,
              height: h,
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(children: [
                Container(
                    width: w * 0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 4),
                    child: Row(
                      children: [
                        Text(
                          "Skills",
                          style: globals.ts((w / 100) * 3.5, globals.blackish,
                              FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: (w / 100) * 2),
                          child: Image.asset("./images/c3.png",
                              width: (w / 100) * 5,
                              height: (h / 100) * 7,
                              fit: BoxFit.fill),
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: (h / 100) * 1),
                    width: w * 0.9,
                    child: Divider(color: globals.greyish, thickness: 1.5)),
                Container(
                    width: w * 0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(w, h, "Backend", backendtechs,
                                    backendtechIcons, value);
                              })),
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(w, h, "Frontend",
                                    frontendTechs, frontendTechIcons, value);
                              })),
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(w, h, "Developers Tool",
                                    devTools, devToolIcons, value);
                              }))
                        ])),
                Container(
                    width: w * 0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(
                                    w, h, "Languages", langs, langIcons, value);
                              })),
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(w, h, "Databases", databases,
                                    databaseIcons, value);
                              })),
                          ChangeNotifierProvider(
                              create: (context) => SkillsProvider(),
                              child: Consumer<SkillsProvider>(
                                  builder: (context, value, child) {
                                return skillCard(w, h, "Core Skills", core,
                                    coreIcons, value);
                              }))
                        ])),
                footer.footer(w, h, context)
              ]))),
        );
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
                      child: Text("Skills",
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
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 3),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(w, h, "Frontent", frontendTechs,
                                frontendTechIcons, value);
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(w, h, "Backend", backendtechs,
                                backendtechIcons, value);
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(w, h, "Developers Tool", devTools,
                                devToolIcons, value);
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(
                                w, h, "Languages", langs, langIcons, value);
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(w, h, "Databases", databases,
                                databaseIcons, value);
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: ChangeNotifierProvider(
                        create: (context) => SkillsProvider(),
                        child: Consumer<SkillsProvider>(
                          builder: (context, value, child) {
                            return mskillCard(
                                w, h, "Core Skills", core, coreIcons, value);
                          },
                        )),
                  )
                ]))));
      }
    });
  }

  Widget skillCard(double w, double h, String name, List<String> l1,
      List<String> l2, SkillsProvider skillsProvider) {
    return InkWell(
        onTap: () {
          ac.forward();
          skillsProvider.changeTaped();
        },
        child:
            // skillCard1(w, h, "Languages", langIcons));
            (skillsProvider.isTaped)
                ? skillCard2(w, h, name, l1)
                    .animate(key: k2)
                    .flipH(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(seconds: 1))
                    .fade(duration: const Duration(seconds: 1))
                : skillCard1(w, h, name, l2)
                    .animate(key: k1)
                    .flipH(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(seconds: 1))
                    .fade(duration: const Duration(seconds: 1)));
  }

  Widget skillCard1(double w, double h, String name, List<String> l) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: w * 0.25,
        height: h * 0.3,
        decoration: BoxDecoration(
            color: globals.greyish,
            border:
                Border.all(color: globals.blackish, width: (w / 100) * 0.1)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name,
                style: globals.ts(
                    (w / 100) * 1.5, globals.blackish, FontWeight.bold)
                // .copyWith(
                //     decoration: TextDecoration.underline,
                //     decorationColor: globals.blackish)
                ),
            Divider(color: globals.blackish, thickness: 1.2),
            Container(
                margin: EdgeInsets.all((h / 100) * 2),
                // height: (h/100)*16.5,
                width: w * 0.25,
                child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: (w / 100) * 1,
                    // crossAxisSpacing: (h / 100) * 1.5,
                    crossAxisCount: 4,
                    childAspectRatio: ((w / 100) * 2) / ((h / 100) * 2),
                    children: List.generate(
                      l.length,
                      (index) =>
                          Image.network(l[index], width: 100, height: 100),
                    )

                    // Row(

                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: List.generate(
                    //         l.length,
                    //         (index) => Container(
                    //               // margin: EdgeInsets.only(right: (w / 100) * 0.5),
                    //               child: Image.network(l[index],
                    //                   width: (w / 100) * 3,
                    //                   height: (h / 100) * 6,
                    //                   fit: BoxFit.fill),
                    //             ))),
                    ))
          ],
        ));
    // .animate()
    // .flipH(duration: const Duration(seconds: 2), curve: Curves.ease);
  }

  Widget skillCard2(double w, double h, String name, List<String> l) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: w * 0.25,
        height: h * 0.3,
        decoration: BoxDecoration(
            color: globals.greyish,
            border:
                Border.all(color: globals.blackish, width: (w / 100) * 0.1)),
        child: Column(children: [
          Text(name,
              style: globals.ts(
                  (w / 100) * 1.5, globals.blackish, FontWeight.bold)),
          Divider(color: globals.blackish, thickness: 1.2),
          Container(
              margin: EdgeInsets.all((h / 100) * 2),
              // height: (h/100)*16.5,
              width: w * 0.25,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: (w / 100) * 1,
                crossAxisSpacing: (h / 100) * 1.5,
                crossAxisCount: 3,
                childAspectRatio: ((w / 100) * 2) / ((h / 100) * 1.5),
                children: List.generate(l.length, (index) {
                  bool is2words = false;
                  List x = l[index].split(' ');
                  if (x.length == 2) {
                    is2words = true;
                  } else {
                    is2words = false;
                  }
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: globals.brownish),
                      child: Text(l[index],
                          textAlign: TextAlign.center,
                          style: globals.ts(
                              (is2words) ? (w / 100) * 0.75 : (w / 100) * 1.1,
                              globals.whitish,
                              null)));
                }),
              ))
        ]));
    // .animate()
    // .flipH(duration: const Duration(seconds: 2), curve: Curves.ease);
  }

  Widget mskillCard(double w, double h, String name, List<String> l1,
      List<String> l2, SkillsProvider skillsProvider) {
    return InkWell(
        onTap: () {
          ac.forward();
          skillsProvider.changeTaped();
        },
        child:
            // skillCard1(w, h, "Languages", langIcons));
            (skillsProvider.isTaped)
                ? mskillCard2(w, h, name, l1)
                    .animate(key: k2)
                    .flipH(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(seconds: 1))
                    .fade(duration: const Duration(seconds: 1))
                : mskillCard1(w, h, name, l2)
                    .animate(key: k1)
                    .flipH(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(seconds: 1))
                    .fade(duration: const Duration(seconds: 1)));
  }

  Widget mskillCard1(double w, double h, String name, List<String> l) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: w * 0.8,
        height: h * 0.3,
        decoration: BoxDecoration(
            color: globals.greyish,
            border:
                Border.all(color: globals.blackish, width: (w / 100) * 0.5)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name,
                style:
                    globals.ts((w / 100) * 4, globals.blackish, FontWeight.bold)
                // .copyWith(
                //     decoration: TextDecoration.underline,
                //     decorationColor: globals.blackish)
                ),
            Divider(color: globals.blackish, thickness: 1.2),
            Container(
                margin: EdgeInsets.all((h / 100) * 1),
                // height: (h/100)*16.5,
                width: w * 0.8,
                child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: (w / 100) * 1,
                    crossAxisSpacing: (h / 100) * 1.5,
                    crossAxisCount: 4,
                    // childAspectRatio: ((w / 100) * 2) / ((h / 100) * 2),
                    children: List.generate(
                      l.length,
                      (index) => Image.network(l[index],
                          width: (w / 100) * 0, fit: BoxFit.fill),
                    )

                    // Row(

                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: List.generate(
                    //         l.length,
                    //         (index) => Container(
                    //               // margin: EdgeInsets.only(right: (w / 100) * 0.5),
                    //               child: Image.network(l[index],
                    //                   width: (w / 100) * 3,
                    //                   height: (h / 100) * 6,
                    //                   fit: BoxFit.fill),
                    //             ))),
                    ))
          ],
        ));
    // .animate()
    // .flipH(duration: const Duration(seconds: 2), curve: Curves.ease);
  }

  Widget mskillCard2(double w, double h, String name, List<String> l) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: w * 0.8,
        height: h * 0.3,
        decoration: BoxDecoration(
            color: globals.greyish,
            border:
                Border.all(color: globals.blackish, width: (w / 100) * 0.5)),
        child: Column(children: [
          Text(name,
              style:
                  globals.ts((w / 100) * 4, globals.blackish, FontWeight.bold)),
          Divider(color: globals.blackish, thickness: 1.2),
          Container(
              margin: EdgeInsets.all((h / 100) * 2),
              // height: (h/100)*16.5,
              width: w * 0.8,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: (w / 100) * 1,
                crossAxisSpacing: (h / 100) * 1.5,
                crossAxisCount: 4,
                // childAspectRatio: ((w / 100) * 3) / ((h / 100) * 0.75),
                children: List.generate(l.length, (index) {
                  bool is2words = false;
                  List x = l[index].split(' ');
                  if (x.length == 2) {
                    is2words = true;
                  } else {
                    is2words = false;
                  }
                  return Container(
                      // padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: globals.brownish),
                      child: Text(l[index],
                          textAlign: TextAlign.center,
                          style: globals.ts(
                              (is2words) ? (w / 100) * 3 : (w / 100) * 4,
                              globals.whitish,
                              null)));
                }),
              ))
        ]));
    // .animate()
    // .flipH(duration: const Duration(seconds: 2), curve: Curves.ease);
  }
}
